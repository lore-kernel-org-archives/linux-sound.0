From: Steve Fink <sfink@reactrix.com>
Date: Wed, 04 May 2005 18:06:33 +0000
Subject: write hanging in i810_audio
Message-Id: <42790F29.6060301@reactrix.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I have half a dozen boxes running Linux, and I'm using esd for audio. 
Three of them have, after running for a day or two, gotten into a state 
where esd is hung. strace shows that it is in a blocking write to 
/dev/dsp. I am using the OSS drivers. /dev/dsp is handled by the 
i810_audio module. Alt-SysRq-T shows this stack trace:

kernel: SysRq : Show State
kernel:
kernel:                          free                        sibling
kernel:   task             PC    stack   pid father child younger older
kernel: esd           S E89FC000     0  6531   6529 
(NOTLB)
kernel: Call Trace:   [<c011d5e5>] schedule [kernel] 0x125 (0xe89fdec0)
kernel: [<c012bb35>] schedule_timeout [kernel] 0x65 (0xe89fdee0)
kernel: [<c012bac0>] process_timeout [kernel] 0x0 (0xe89fdf00)
kernel: [<f89b39ff>] i810_write [i810_audio] 0x2df (0xe89fdf18)
kernel: [<c0153a53>] sys_write [kernel] 0xa3 (0xe89fdf94)

What's the easiest way to disassemble a chunk of kernel memory while 
you're running? I ended up writing a perl script using Disassemble::X86 
for disassembling a chunk of /proc/kcore to track down the address 
within i810_write, along with the running kernel's System.map and 
/proc/ksyms and `nm i180_audio.o` to resolve the symbols. Surely there's 
an easier way?

Anyway, the relevant portion of the disassembly is below. It allowed me 
to track down the source location to the schedule_timeout() in 
i810_audio.c here:

   dmabuf->trigger = PCM_ENABLE_OUTPUT;
   i810_update_lvi(state,0);
   if (file->f_flags & O_NONBLOCK) {
     if (!ret) ret = -EAGAIN;
     goto ret;
   }
   /* Not strictly correct but works */
   tmo = (dmabuf->dmasize * HZ * 2) / (dmabuf->rate * 4);
   /* There are two situations when sleep_on_timeout returns,
      one is when the interrupt is serviced correctly and the
      process is waked up by ISR ON TIME. Another is when
      timeout is expired, which means that either interrupt is
      NOT serviced correctly (pending interrupt) or it
      is TOO LATE for the process to be scheduled to run
      (scheduler latency) which results in a (potential) buffer
      underrun. And worse, there is NOTHING we can do to prevent it. */
   if (!schedule_timeout(tmo >= 2 ? tmo : 2)) {
#ifdef DEBUG
     printk(KERN_ERR "i810_audio: playback schedule timeout, "
                     "dmasz %u fragsz %u count %i hwptr %u swptr %u\n",
                     dmabuf->dmasize, dmabuf->fragsize, dmabuf->count,
                     dmabuf->hwptr, dmabuf->swptr);
#endif
     /* a buffer underrun, we delay the recovery until next time the
        while loop begin and we REALLY have data to play */
     //return ret;
   }

I'm way out of my depth here, but it seems like it's expecting a DMA 
transfer to come back and it never does.

First, is this a known problem? Second, how could I go about debugging 
this further? I don't have a reliable way of reproducing the problem, so 
I'm interested in ways of diagnosing the running system in its hung 
state. Can I dump out the state of active DMA requests somehow? What's 
the easiest way to see the registers for this stack frame (or for this 
execution context, at least)?

The disassembly of the relevant chunk of kernel memory around the 
i180_write stack frame is here:

f89b39ce  mov eax,dword[esi+0x40]
f89b39d1  lea eax,[eax+eax*4]
f89b39d4  lea eax,[eax+eax*4]
f89b39d7  lea edx,[eax*8+0x0]
f89b39af  nop
f89b39b0* mov byte[esi+0x6],0x2 (from f89b3929)
f89b39b4  mov dword[ss:esp+0x4],0x0
f89b39bc  mov dword[ss:esp],ebx
f89b39bf  call 0xf89b2d20 (i810_update_lvi)
f89b39c4  mov edi,dword[ss:esp+0x7c]
f89b39c8  test byte[edi+0x19],0x8
f89b39af  nop
f89b39b0* mov byte[esi+0x6],0x2 (from f89b3929)
f89b39b4  mov dword[ss:esp+0x4],0x0
f89b39bc  mov dword[ss:esp],ebx
f89b39bf  call 0xf89b2d20 (i810_update_lvi)
f89b39c4  mov edi,dword[ss:esp+0x7c]
f89b39c8  test byte[edi+0x19],0x8
f89b39cc  jne 0xf89b3a27 (i810_write+0x307)
f89b39ce  mov eax,dword[esi+0x40]
f89b39d1  lea eax,[eax+eax*4]
f89b39d4  lea eax,[eax+eax*4]
f89b39d7  lea edx,[eax*8+0x0]
f89b39de  mov eax,dword[esi]
f89b39e0  lea ecx,[eax*4+0x0]
f89b39e7  mov eax,edx
f89b39e9  xor edx,edx
f89b39eb  div ecx
f89b39ed  mov ecx,eax
f89b39ef  mov eax,0x2
f89b39f4  cmp ecx,0x1
f89b39f7  cmova eax,ecx
f89b39fa  call 0xc012bad0 (schedule_timeout)
f89b39ff  mov edx,dword[ss:esp+0x14]

I am running RedHat's 2.4.21-20.EL kernel on an ICH5 board.
