From: Jaakko Niemi <liiwi@lonesom.pp.fi>
Date: Tue, 04 Apr 2000 14:13:34 +0000
Subject: oopses with 2.3.99pre4-3
MIME-Version: 1
Content-Type: multipart/mixed; boundary="EVF5PPMfhYS0aIcm"
Message-Id: <marc-linux-sound-95485914910743@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

 Opening xmms leads into following oops
 with 2.3.99pre4-3. This happens with both
 kernel drivers and alsa. 
 Card is sb awe 64 gold.
 
 Btw. is is normal that kernel isapnp does not
 enable the sb part of this card?
 
  Thanks.

--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="foo.out"

ksymoops 2.3.3 on i686 2.3.99-pre4.  Options used
     -V (default)
     -k /proc/ksyms (default)
     -l /proc/modules (default)
     -o /lib/modules/2.3.99-pre4/ (default)
     -m /boot/System.map-2.3.99-pre4 (default)

Warning: You did not tell me where to find symbol information.  I will
assume that the log matches the kernel and modules that are running
right now and I'll use the default options above for symbol resolution.
If the current kernel and/or modules do not match the log, you can get
more accurate output by telling me the kernel version and where to find
map, modules, ksyms etc.  ksymoops -h explains the options.

Unable to handle kernel NULL pointer dereference at virtual address 00000094
 c01369b7
 *pde = 00000000
 Oops: 0000
 CPU:    0
 EIP:    0010:[<c01369b7>]
Using defaults from ksymoops -t elf32-i386 -a i386
 EFLAGS: 00013202
 eax: cefdff7c   ebx: cf788c40   ecx: 00000000   edx: 00000000
 esi: cefdff7c   edi: 00000001   ebp: 00000002   esp: cefdfec8
 ds: 0018   es: 0018   ss: 0018
 Process XF86_SVGA (pid: 230, stackpage=cefdf000)
 Stack: cf788c40 cefdff7c cf788c40 c0136f08 00000000 00000001 cf788c40
cefdff7c 
       00000003 00000002 00000000 00003246 c013cf70 c1487860 c01371e8
cefdff7c 
       cf788c40 00000001 cf788c40 00000000 cefdff7c 00000002 00000004
00000001 
Call Trace: [<c0136f08>] [<c013cf70>] [<c01371e8>] [<c012c9aa>] [<c0154b3d>]
[<c010f05d>] [<c010ad3c>] 
Code: 8b 81 94 00 00 00 0f b7 59 22 85 c0 74 13 8b 40 30 85 c0 74 

>>EIP; c01369b7 <permission+b/110>   <=====
Trace; c0136f08 <lookup_dentry+23c/25c>
Trace; c013cf70 <dput+e0/158>
Trace; c01371e8 <open_namei+54/378>
Trace; c012c9aa <__filp_open+3e/64>
Trace; c0154b3d <sys_shmat+b9/12c>
Trace; c010f05d <sys_ipc+159/1d0>
Trace; c010ad3c <system_call+34/38>
Code;  c01369b7 <permission+b/110>
00000000 <_EIP>:
Code;  c01369b7 <permission+b/110>   <=====
   0:   8b 81 94 00 00 00         mov    0x94(%ecx),%eax   <=====
Code;  c01369bd <permission+11/110>
   6:   0f b7 59 22               movzwl 0x22(%ecx),%ebx
Code;  c01369c1 <permission+15/110>
   a:   85 c0                     test   %eax,%eax
Code;  c01369c3 <permission+17/110>
   c:   74 13                     je     21 <_EIP+0x21> c01369d8 <permission+2c/110>
Code;  c01369c5 <permission+19/110>
   e:   8b 40 30                  mov    0x30(%eax),%eax
Code;  c01369c8 <permission+1c/110>
  11:   85 c0                     test   %eax,%eax
Code;  c01369ca <permission+1e/110>
  13:   74 00                     je     15 <_EIP+0x15> c01369cc <permission+20/110>

Unable to handle kernel NULL pointer dereference at virtual address 00000070
 *pde = 00000000
 Oops: 0000
 CPU:    0
 EIP:    0010:[<c0154c69>]
 EFLAGS: 00010202
 eax: 00000070   ebx: 00000054   ecx: fffffffe   edx: c01eea0e
 esi: cf788c40   edi: cda29eb8   ebp: 00008000   esp: cda29eac
 ds: 0018   es: 0018   ss: 0018
 Process xmms (pid: 309, stackpage=cda29000)
 Stack: 00010002 40014000 cec895c0 4350492e 3030305f 30303031 cec80032
c0154db2 
       00010002 cddcf300 c0121827 cddcf300 cec895c0 0000000f cda28000
cda29fc4 
       cd886c80 c0114d45 cec895c0 cec895c0 c011a291 cec895c0 0000000f
0000000f 
Call Trace: [<c0154db2>] [<c0121827>] [<c0114d45>] [<c011a291>] [<c010abfb>]
[<c010ad84>] 
Code: 39 43 1c 74 29 50 8b 43 1c 50 68 80 e7 1e c0 e8 7f 15 fc ff 

>>EIP; c0154c69 <shm_remove_name+3d/f4>   <=====
Trace; c0154db2 <shm_close+92/b4>
Trace; c0121827 <exit_mmap+7b/120>
Trace; c0114d45 <mmput+15/2c>
Trace; c011a291 <do_exit+b9/340>
Trace; c010abfb <do_signal+223/27c>
Trace; c010ad84 <signal_return+14/18>
Code;  c0154c69 <shm_remove_name+3d/f4>
00000000 <_EIP>:
Code;  c0154c69 <shm_remove_name+3d/f4>   <=====
   0:   39 43 1c                  cmp    %eax,0x1c(%ebx)   <=====
Code;  c0154c6c <shm_remove_name+40/f4>
   3:   74 29                     je     2e <_EIP+0x2e> c0154c97 <shm_remove_name+6b/f4>
Code;  c0154c6e <shm_remove_name+42/f4>
   5:   50                        push   %eax
Code;  c0154c6f <shm_remove_name+43/f4>
   6:   8b 43 1c                  mov    0x1c(%ebx),%eax
Code;  c0154c72 <shm_remove_name+46/f4>
   9:   50                        push   %eax
Code;  c0154c73 <shm_remove_name+47/f4>
   a:   68 80 e7 1e c0            push   $0xc01ee780
Code;  c0154c78 <shm_remove_name+4c/f4>
   f:   e8 7f 15 fc ff            call   fffc1593 <_EIP+0xfffc1593> c01161fc <printk+0/15c>


1 warning issued.  Results may not be reliable.

--EVF5PPMfhYS0aIcm--
