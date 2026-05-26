Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC4A242D72;
	Tue, 26 May 2026 01:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779759183; cv=none; b=DQrcMQceKhQ+Vs7GYVnfdqceH8BmwGdENtBMB3W8TvVLFdV2Wt324QTbrk8LW37t4hFotUlQWPE9ftl2+Bg5pWG2DjnDLZ4HGRJoTkAZUa9pnvR2ItOVSNkzmv9eXSGXoK2AuNr3V1H6yGyjIxvwcSqAMaF4vCnhH80iO222j8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779759183; c=relaxed/simple;
	bh=ugRw1ctSP/Ut7noKQfc0aNqbHXKK/U9Lsd/cQRDXZOU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ub4WObkzO0m4jGBLAhJWMH74N1dwXO5lbSP2AAWOJBC9HYU74u4KZreQBQKSB5ezHtGH/Z97SWQUUyBTfXdaM5ZUlSEyI4d4RecGGAwdKr1v69Kl6jO2DNSnWQMLlyInDhJCWCgwQo+mmPJP6TfTt7jv9gTVSyBLAOXNSUzOQy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mails.ucas.ac.cn; spf=pass smtp.mailfrom=mails.ucas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mails.ucas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mails.ucas.ac.cn
Received: from fric.. (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAAnf9JA+BRq_ZpzEQ--.4125S2;
	Tue, 26 May 2026 09:32:48 +0800 (CST)
From: Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
To: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Kees Cook <kees@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
Subject: [PATCH] ALSA: pcm: Fix NULL dereference in import_ubuf() during exit
Date: Tue, 26 May 2026 01:32:45 +0000
Message-Id: <20260526013245.785435-1-xujiakai24@mails.ucas.ac.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAnf9JA+BRq_ZpzEQ--.4125S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WFWxKr48XFWxJFykuFyxGrg_yoW7KFyUpr
	15Wr1UGr48tF1xAr48JFy5tr18Jr15A3W3Wr4xGwn5AF1DWr1UJw1kKrW7WrWDAr4jqa47
	KF4qy3y8KryUJaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr
	0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8v
	x2IErcIFxwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUvAp5UUUUU=
X-CM-SenderInfo: 50xmxthndljko6pdxz3voxutnvoduhdfq/

snd_pcm_oss_sync() calls snd_pcm_lib_write(substream, NULL, size) to
fill silence.  The in_kernel flag is hard-coded to false by the wrapper,
so do_transfer() falls through to import_ubuf() with a garbage pointer
(NULL + frame_offset).  When the process is in do_exit() and current->mm
is already NULL, import_ubuf()'s access_ok() crashes dereferencing 
mm->context.pmlen.

Add a NULL guard in do_transfer() to use iov_iter_kvec() with a dummy
kvec for the fill_silence path, avoiding the import_ubuf() call.  The
fill_silence transfer function ignores the iov_iter, so the dummy kvec
is safe.

Fixes: cf393babb37a1 ("ALSA: pcm: Add copy ops with iov_iter")
Signed-off-by: Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
---
 sound/core/pcm_lib.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 09c421cd9319e..7429a33da0afa 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -2115,6 +2115,21 @@ static int do_transfer(struct snd_pcm_substream *substream, int c,
 		return transfer(substream, c, hwoff, &iter, bytes);
 	}
 
+	/*
+	 * When data is NULL (fill_silence path), import_ubuf() would
+	 * be called with a garbage userspace pointer that is neither a
+	 * valid kernel nor user address.  This can crash when current->mm
+	 * is NULL (e.g., during do_exit() -> exit_files() -> __fput()).
+	 * Since fill_silence ignores the iov_iter entirely, use a dummy
+	 * kvec to avoid the import_ubuf path.
+	 */
+	if (!data) {
+		struct kvec kvec = { NULL, 0 };
+
+		iov_iter_kvec(&iter, type, &kvec, 1, bytes);
+		return transfer(substream, c, hwoff, &iter, bytes);
+	}
+
 	err = import_ubuf(type, (__force void __user *)data, bytes, &iter);
 	if (err)
 		return err;
-- 
2.34.1

Found by fuzzing. Here is the report:

Unable to handle kernel paging request at virtual address dfffffff00000124
Current syz.3.559 pgtable: 4K pagesize, 57-bit VAs, pgdp=0x000000008a70e000
[dfffffff00000124] pgd=000000005fffe401, p4d=000000005fffe001, pud=0000000000000000
Oops [#1]
Modules linked in:
CPU: 1 UID: 0 PID: 16564 Comm: syz.3.559 Tainted: G        W    L      7.1.0-rc1-gdb909bd7986c #1 PREEMPT 
Tainted: [W]=WARN, [L]=SOFTLOCKUP
Hardware name: riscv-virtio,qemu (DT)
epc : __untagged_addr_remote arch/riscv/include/asm/uaccess.h:19 [inline]
epc : __untagged_addr_remote arch/riscv/include/asm/uaccess.h:16 [inline]
epc : import_ubuf+0x2a2/0x3a2 lib/iov_iter.c:1449
 ra : import_ubuf+0x270/0x3a2 lib/iov_iter.c:1449
epc : ffffffff818b2f64 ra : ffffffff818b2f32 sp : ff200000025072d0
 gp : ffffffff8a395420 tp : ff600000b3628000 t0 : ff20000002507610
 t1 : 000000000000f2f2 t2 : ffffffff8537e050 s0 : ff20000002507320
 s1 : ff20000002507390 a0 : 0000000000000920 a1 : 0000000000000000
 a2 : 0000000000000002 a3 : ffffffff818b2f32 a4 : 0000000000000124
 a5 : dfffffff00000124 a6 : 0000000000000003 a7 : 0000000000000001
 s2 : 0000000000000001 s3 : 0000000000001ed0 s4 : 0000000000000000
 s5 : 0000000000000000 s6 : 1fe40000004a0e68 s7 : ffffffff850652f4
 s8 : 0000000000000000 s9 : 0000000000002130 s10: ff20000002507390
 s11: 0000000000000001 t3 : 000000000000f1f1 t4 : ffebffff1198b11f
 t5 : ffebffff1198b120 t6 : 0000000000000002 ssp : 0000000000000000
status: 0000000200000120 badaddr: dfffffff00000124 cause: 000000000000000d
[<ffffffff818b2f64>] __untagged_addr_remote arch/riscv/include/asm/uaccess.h:19 [inline]
[<ffffffff818b2f64>] __untagged_addr_remote arch/riscv/include/asm/uaccess.h:16 [inline]
[<ffffffff818b2f64>] import_ubuf+0x2a2/0x3a2 lib/iov_iter.c:1449
[<ffffffff85065670>] do_transfer+0x128/0x1dc sound/core/pcm_lib.c:2118
[<ffffffff850657ce>] interleaved_copy+0xaa/0xd6 sound/core/pcm_lib.c:2141
[<ffffffff85071c84>] __snd_pcm_lib_xfer+0xc98/0x1c3a sound/core/pcm_lib.c:2380
[<ffffffff850b4376>] snd_pcm_lib_write include/sound/pcm.h:1194 [inline]
[<ffffffff850b4376>] snd_pcm_oss_sync+0x5f2/0x6e8 sound/core/oss/pcm_oss.c:1713
[<ffffffff850b469a>] snd_pcm_oss_release+0x22e/0x2aa sound/core/oss/pcm_oss.c:2584
[<ffffffff80cf2748>] __fput+0x382/0xac6 fs/file_table.c:510
[<ffffffff80cf2f3a>] ____fput+0x1c/0x26 fs/file_table.c:538
[<ffffffff801f13b2>] task_work_run+0x16a/0x25e kernel/task_work.c:233
[<ffffffff80169d02>] exit_task_work include/linux/task_work.h:40 [inline]
[<ffffffff80169d02>] do_exit+0x8e4/0x2a6c kernel/exit.c:975
[<ffffffff8016c3ea>] do_group_exit+0xd4/0x26c kernel/exit.c:1117
[<ffffffff801a6fb0>] get_signal+0x2070/0x22aa kernel/signal.c:3037
[<ffffffff80073690>] arch_do_signal_or_restart+0xc12/0x1d72 arch/riscv/kernel/signal.c:534
[<ffffffff803eca40>] __exit_to_user_mode_loop kernel/entry/common.c:64 [inline]
[<ffffffff803eca40>] exit_to_user_mode_loop+0x9c/0x7a4 kernel/entry/common.c:98
[<ffffffff866faa3c>] __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
[<ffffffff866faa3c>] syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:238 [inline]
[<ffffffff866faa3c>] syscall_exit_to_user_mode include/linux/entry-common.h:318 [inline]
[<ffffffff866faa3c>] do_trap_ecall_u+0x490/0x5de arch/riscv/kernel/traps.c:345
[<ffffffff867267f6>] handle_exception+0x15e/0x16a arch/riscv/kernel/entry.S:232
Code: 0513 9205 07b7 e000 9556 17fd 5713 0035 1782 97ba (8783) 0007 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	92050513          	addi	a0,a0,-1760
   4:	e00007b7          	lui	a5,0xe0000
   8:	9556                	add	a0,a0,s5
   a:	17fd                	addi	a5,a5,-1 # 0xffffffffdfffffff
   c:	00355713          	srli	a4,a0,0x3
  10:	1782                	slli	a5,a5,0x20
  12:	97ba                	add	a5,a5,a4
* 14:	00078783          	lb	a5,0(a5) <-- trapping instruction

<<<<<<<<<<<<<<< tail report >>>>>>>>>>>>>>>

