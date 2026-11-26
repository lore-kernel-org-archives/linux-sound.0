Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=132.226.202.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696559;
	b=3lbxPtI9BQicN8rCepturjXE/DqkQNjlEvZkDrDZwVggotZk6pAD5oKEsddoTtL83icD
	 YWmUqFFcnmfHgrU07a1/aTmHxKdcWdtDZY8bzajsyDvFjjlfOFzjP6i0hrRFmA2hfIkA5
	 ESysVfEfFjMAMI+TSLHz4jvjUxXK9jHXT9/FGPFcZUG3cV6Me6t/hWebQjVHH5uKJ9JwK
	 EOb7RutqGCwOz+G9rh1c9zXNz4mmjhEvfkf1BCJ3eBbSWMJyD7Z+ikkZMImwq3oKZsRYg
	 II4DHMmlrSJTJ314nKqq2Wh/Q3/WTuRJwyQk/ez/Ul7Pp7KYxNBQSAVmpjG6IOZVQYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696559;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=OmsM6s2j2Da5/TTXWuUxbvyNAAwghqaC+fHkUhJp2bc=;
	b=Gu5uoTl1HlBPDce5CLBITmukerVjpaso4ClTSlUz9I716WqY66kZT8WmOKzZhKjh8coJ
	 DUd2ydHVz8+25KBTTgHzBZBLSrfWezutYajjTCQ4V1ead39yDkYUUeuvbuVuxVkk4lQ6T
	 HCYSZXr1DXOsAiSM/+N7Rj6W8WxNKY61tKuTUeOfIQYkQVgOssCVrIxcEZTyB2HcQrz2Q
	 8R+D85KIfc16EaUlkR231FWi4cxSs4Re/3SRCbggBSxZcyG4aV/ib+61H7UeE+vJwo1W+
	 w2niz54XcDpxLl0jF+nkQEkfNP0K11+sJjJ4euijvuo/cSaFzstekAkf9PjvUs/o+Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=132.226.202.154
Received: from fraori-sdnproxy-3.icoremail.net (fraori-sdnproxy-3.icoremail.net [132.226.202.154])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC57606A321;
	Thu, 26 Nov 2026 12:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CC57606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with UTF8SMTP id IAEQrMC2_c6nJwhrf4YRAA--.62814S2;
	Thu, 26 Nov 2026 20:35:51 +0800 (CST)
Received: from [222.20.126.109] (unknown [222.20.126.109])
	by gateway (Coremail) with SMTP id _____wCngRamJwhrb7IjAA--.18280S2;
	Thu, 26 Nov 2026 20:35:50 +0800 (CST)
From: Hanxiang Xu <xuhx@hust.edu.cn>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: ctxfi: wait for a running system-timer callback in the free path
Date: Thu, 26 Nov 2026 20:25:18 +0800
Message-ID: <20261126202600.1-1-xuhx@hust.edu.cn>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMC2_c6nJwhrf4YRAA--.62814S2
Authentication-Results: app1; spf=neutral smtp.mail=xuhx@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7KF4xKFy8JFW8Gw4rXr1DWrg_yoW8Zrykp3
	98uw1aqw18Zr40k3s7WrWDJ34kArZ3Aa4UGFn5GwnayFnxWw18tFW7KF12yF47ZrWv9Fy2
	y340va98Ar45JFJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9mb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzx
	vE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VACjcxG62k0Y48FwI0_Gr1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7V
	CY1x0262k0Y48FwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l
	c2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
	0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07bcwZcUUUUU=
X-CM-SenderInfo: bgsqjkayqyjmo6kx23oohg3hdfq/

Currently, ct_systimer_free is aliased to ct_systimer_prepare, which
calls timer_delete_sync_try(). While ct_systimer_prepare() must remain
non-sleeping because it can run under the PCM stream lock, using
timer_delete_sync_try() in the free path is unsafe: if the timer
callback is concurrently running on another CPU, timer_delete_sync_try()
returns -1 without waiting for completion. The caller then proceeds to
free the ct_timer_instance object, resulting in a use-after-free in the
still-running timer callback.

Replace the ct_systimer_free macro with a dedicated function that calls
timer_shutdown_sync(), which waits for any running callback to finish
and prevents the timer from being rearmed before the instance is freed.

Cc: <stable@vger.kernel.org>
Signed-off-by: Hanxiang Xu <xuhx@hust.edu.cn>
---
Changes in v2:
 - Set From: to Hanxiang Xu <xuhx@hust.edu.cn> matching Signed-off-by:
 - Use a single blank line before Cc: <stable@vger.kernel.org>
 - Format cleanly with git format-patch to preserve tabs and spacing

 sound/pci/ctxfi/cttimer.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/pci/ctxfi/cttimer.c b/sound/pci/ctxfi/cttimer.c
index 9d6f5df..fea9d61 100644
--- a/sound/pci/ctxfi/cttimer.c
+++ b/sound/pci/ctxfi/cttimer.c
@@ -111,11 +111,17 @@ static void ct_systimer_stop(struct ct_timer_instance *ti)
 
 static void ct_systimer_prepare(struct ct_timer_instance *ti)
 {
+	/* non-sleeping: also runs under the PCM stream lock */
 	ct_systimer_stop(ti);
 	timer_delete_sync_try(&ti->timer);
 }
 
-#define ct_systimer_free	ct_systimer_prepare
+static void ct_systimer_free(struct ct_timer_instance *ti)
+{
+	/* may sleep: wait for a callback running on another CPU */
+	ct_systimer_stop(ti);
+	timer_shutdown_sync(&ti->timer);
+}
 
 static const struct ct_timer_ops ct_systimer_ops = {
 	.init = ct_systimer_init,
-- 
2.43.0

