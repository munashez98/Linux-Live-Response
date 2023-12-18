#include <linux/module.h>
#define INCLUDE_VERMAGIC
#include <linux/build-salt.h>
#include <linux/elfnote-lto.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

BUILD_SALT;
BUILD_LTO_INFO;

MODULE_INFO(vermagic, VERMAGIC_STRING);
MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__section(".gnu.linkonce.this_module") = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

#ifdef CONFIG_RETPOLINE
MODULE_INFO(retpoline, "Y");
#endif

static const struct modversion_info ____versions[]
__used __section("__versions") = {
	{ 0x32e21920, "module_layout" },
	{ 0x9fb74541, "kernel_write" },
	{ 0x26087692, "kmalloc_caches" },
	{ 0xeb233a45, "__kmalloc" },
	{ 0xc4f0da12, "ktime_get_with_offset" },
	{ 0xf888ca21, "sg_init_table" },
	{ 0x8cddb2a, "kernel_sendmsg" },
	{ 0x59d2a97, "param_ops_int" },
	{ 0x77358855, "iomem_resource" },
	{ 0x754d539c, "strlen" },
	{ 0x3c13f8ee, "crypto_stats_ahash_update" },
	{ 0xe2c7e7f, "sock_release" },
	{ 0x9e2fb826, "filp_close" },
	{ 0x484f0e16, "sock_create_kern" },
	{ 0xaa4cf7b, "kernel_listen" },
	{ 0x97651e6c, "vmemmap_base" },
	{ 0x3c3ff9fd, "sprintf" },
	{ 0xec090c66, "crypto_ahash_final" },
	{ 0x5b8239ca, "__x86_return_thunk" },
	{ 0x961710e2, "param_ops_charp" },
	{ 0xb2dc204, "sock_set_reuseaddr" },
	{ 0xa7bfbf2f, "current_task" },
	{ 0xbcab6ee6, "sscanf" },
	{ 0x531b604e, "__virt_addr_valid" },
	{ 0xd0760fc0, "kfree_sensitive" },
	{ 0xe06444bc, "kernel_sock_shutdown" },
	{ 0x5a0b73d0, "zlib_deflateInit2" },
	{ 0xb014a89f, "init_net" },
	{ 0x7cd8d75e, "page_offset_base" },
	{ 0x33b84f74, "copy_page" },
	{ 0x6a5cb5ee, "__get_free_pages" },
	{ 0xe9f7149c, "zlib_deflate_workspacesize" },
	{ 0xd0da656b, "__stack_chk_fail" },
	{ 0x65487097, "__x86_indirect_thunk_rax" },
	{ 0x3445550c, "crypto_destroy_tfm" },
	{ 0xbdfb6dbb, "__fentry__" },
	{ 0xf35141b2, "kmem_cache_alloc_trace" },
	{ 0xf2c43f3f, "zlib_deflate" },
	{ 0x4db09b27, "kernel_accept" },
	{ 0x4302d0eb, "free_pages" },
	{ 0xb320cc0e, "sg_init_one" },
	{ 0x37a0cba, "kfree" },
	{ 0x59d743f9, "param_ops_long" },
	{ 0x3d3fe492, "kernel_bind" },
	{ 0xc890c008, "zlib_deflateEnd" },
	{ 0x7dc9881f, "vmalloc_to_page" },
	{ 0x3ee0e1fa, "crypto_stats_get" },
	{ 0xe914e41e, "strcpy" },
	{ 0xe8cd8bfd, "crypto_alloc_ahash" },
	{ 0xa0c4c91b, "filp_open" },
};

MODULE_INFO(depends, "");


MODULE_INFO(srcversion, "E844769B821676A19BDD5A3");
