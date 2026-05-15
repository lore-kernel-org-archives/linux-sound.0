Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208711A2C04;
	Fri, 15 May 2026 05:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778822147; cv=none; b=TPvBsZMmQt55fDgm5HIu4H2CzpORUOylVWhFC/NXkaw5ZW55O/faTevbin2t9r2yisWBiwmj4iMcT4VH2eC0JL8lPbPKS4wswvapcLkanmhQYW86TkR1kvsYLDiqNpGf53UV10WNyNLnH+32RPcYWp0rIIIpl3ANB2rRbJwN+Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778822147; c=relaxed/simple;
	bh=be5ptxubEjUk0N7NR53ZBEfB4rhP8Aa4a9n7LY1XoMs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ErAq5sOrEaVvlHN0pxC54Il9MtpRAcfZ3UtJidPqpcTkftzMyf34kSYT5ABZNDknGuv7H4144chCugncq/JL6IPtmh3cz3wYqXHAqccoe5J6vH6rqeeV8xNgxn4mZJYsGL7L/7jVOmbKexl9KrG8Mo6ro2RN3PGTrKnvb1M2+jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mails.ucas.ac.cn; spf=pass smtp.mailfrom=mails.ucas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mails.ucas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mails.ucas.ac.cn
Received: from fric.. (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABXctnmqwZqjWoOEQ--.9826S2;
	Fri, 15 May 2026 13:15:18 +0800 (CST)
From: Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
To: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Cen Zhang <zzzccc427@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jiakai Xu <xujiakai24@mails.ucas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: [PATCH] ALSA: pcm: oss: Use snd_pcm_kernel_write() in snd_pcm_oss_sync()
Date: Fri, 15 May 2026 05:15:16 +0000
Message-Id: <20260515051516.3103036-1-xujiakai24@mails.ucas.ac.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABXctnmqwZqjWoOEQ--.9826S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur1UtFWUZFWkCFykWFW5GFg_yoW8CFyDpr
	yYkr4I9r97tFWkA3WDJF1FvF1rJwn0yFyYk34DC34Fvws09r1jqFWq9ry2vF4DCFZ7Kws0
	qr4vya4rJa45JaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxh
	VjvjDU0xZFpf9x0JU-zVUUUUUU=
X-CM-SenderInfo: 50xmxthndljko6pdxz3voxutnvoduhdfq/

During a process exit, do_exit() calls exit_mm() before exit_files(),
so current->mm is already NULL when __fput() triggers
snd_pcm_oss_release() -> snd_pcm_oss_sync(). The latter calls
snd_pcm_lib_write() with a NULL buffer to fill the remaining ALSA
period with silence. snd_pcm_lib_write() passes in_kernel=false to
__snd_pcm_lib_xfer(), causing do_transfer() to call
import_ubuf(ITER_SOURCE, NULL, ...) which invokes access_ok(NULL, ...).
On RISC-V, untagged_addr() in access_ok() dereferences
current->mm->context.pmlen, crashing with a NULL pointer dereference.

Fix by using snd_pcm_kernel_write() and snd_pcm_kernel_writev() instead,
which pass in_kernel=true and use iov_iter_kvec() to bypass user-space
address validation entirely. Since the buffer is NULL and the transfer
function fill_silence() ignores the iterator and writes directly to the
DMA buffer, this is safe.

Fixes: 13f72c8c28fc ("ALSA: pcm: Kill set_fs() in PCM OSS layer")
Signed-off-by: Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
---
 sound/core/oss/pcm_oss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 33fd34f0d615..4f81002e4b96 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -1710,9 +1710,9 @@ static int snd_pcm_oss_sync(struct snd_pcm_oss_file *pcm_oss_file)
 		if (size > 0) {
 			size = runtime->period_size - size;
 			if (runtime->access == SNDRV_PCM_ACCESS_RW_INTERLEAVED)
-				snd_pcm_lib_write(substream, NULL, size);
+				snd_pcm_kernel_write(substream, NULL, size);
 			else if (runtime->access == SNDRV_PCM_ACCESS_RW_NONINTERLEAVED)
-				snd_pcm_lib_writev(substream, NULL, size);
+				snd_pcm_kernel_writev(substream, NULL, size);
 		}
 unlock:
 		mutex_unlock(&runtime->oss.params_lock);
-- 
2.34.1

