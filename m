Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5CF3DEAC0
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 13:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778765173; cv=none; b=gYtyBCuvjaCXGeZXrg1eIy8tXZ37rb+qJTZ5xgnMmPWHJEPdHRJBcudp8qjCh9lXAqIuCmvOjKg3OL5FfDLpN6DAooUrj+mjzBru37H09yqAZeYycsH6Esi4FIYFshf2xcK/x5cYnlUtxw54W4pnCoJ81885+DNHnu0dIR4odw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778765173; c=relaxed/simple;
	bh=hvXp5geEBsoY1KF5GPedn43idJB5mvMV9DDtctqgLbo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oCZvWZxpOJjF8jqBbUkIzmIu5RrXKAHPTVjqVtjECMxwt8FqVkrswPP4m1TBEk4ECytovWYFvFiUeehEO7ypLfE69uX6sNyTsCSp0DV2sTBcqEaiJDiRtUcuTN7AwMyXhOj+PI51bgEgPpBcXBc8dqaOb5tCN05fcyXPotf+KJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=std.uestc.edu.cn; spf=pass smtp.mailfrom=std.uestc.edu.cn; dkim=fail (0-bit key) header.d=std.uestc.edu.cn header.i=@std.uestc.edu.cn header.b=48SA4n8c reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=std.uestc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=std.uestc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=std.uestc.edu.cn header.i=@std.uestc.edu.cn header.b="48SA4n8c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=std.uestc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=TOXVHjDVzF
	ygw+K9lJDsQxFhuqnj6UjEQfS91jQPGuY=; b=48SA4n8cgB/djUnQh661IUUJez
	/Qau+XFbWL6QGnsboawHijuXfoOiIsvI3YJDL/zXB0a9Y6eJWWTUvlHY/Utg5Xjl
	ne6j1dO1WZ3V8JhmDnIeOvk27b0IXB3eRCNkdCexy0cJt369yLqKu7gXZKCA2nwf
	C1n/tW/KXA2YDV7XI=
Received: from hotaru.tailb307d0.ts.net (unknown [183.95.73.109])
	by hzbj-edu-front-3.icoremail.net (Coremail) with SMTP id BbQMCkBGaDJezQVq8BEVAg--.8548S2;
	Thu, 14 May 2026 21:25:52 +0800 (CST)
From: Quan Sun <2022090917019@std.uestc.edu.cn>
To: linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	thorsten.blum@linux.dev,
	ian_minett@creativelabs.com
Cc: Quan Sun <2022090917019@std.uestc.edu.cn>
Subject: [PATCH] ALSA: hda: Fix NULL pointer dereference in snd_hda_ctl_add()
Date: Thu, 14 May 2026 21:22:45 +0800
Message-ID: <20260514132245.3062884-1-2022090917019@std.uestc.edu.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BbQMCkBGaDJezQVq8BEVAg--.8548S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw1xZFWfAr4fAw4xKF4rKrg_yoW8GF1fpr
	1kKFy8KFn3AF10vrsrW3W7WFn0kas5KFn8Aay0k3ZrCF1fAF48Kw1Fq34093W5CFs3KFy7
	ZFW2yr90yw15A3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
	WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
	67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
	IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
	0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2Kf
	nxnUUI43ZEXa7VUjJ3vUUUUUU==
X-CM-SenderInfo: asqsjiyzqzilqqrzq21wgo3vxvwfhvlgxou0/

snd_hda_ctl_add() dereferences kctl->id.subdevice without checking
whether kctl is NULL. Multiple callers in sound/hda/codecs/ca0132.c
pass the return value of snd_ctl_new1() directly to snd_hda_ctl_add()
without a NULL check:

    return snd_hda_ctl_add(codec, nid, snd_ctl_new1(&knew, codec));

snd_ctl_new1() returns NULL when the underlying snd_ctl_new() fails
on memory allocation (kzalloc_flex),which can occur under memory
pressure or via fault injection.

Add a NULL check at the entry of snd_hda_ctl_add(), matching the
pattern already used by snd_ctl_add_replace() at the same call
path (sound/core/control.c:515). Return -EINVAL to let callers
handle the error gracefully.

Fixes: 44f0c9782cc6 ("ALSA: hda/ca0132: Add tuning controls")
Signed-off-by: Quan Sun <2022090917019@std.uestc.edu.cn>
---
 sound/hda/common/codec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index c2af2511a8316..81f266b9b850f 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -1699,6 +1699,9 @@ int snd_hda_ctl_add(struct hda_codec *codec, hda_nid_t nid,
 	unsigned short flags = 0;
 	struct hda_nid_item *item;
 
+	if (!kctl)
+		return -EINVAL;
+
 	if (kctl->id.subdevice & HDA_SUBDEV_AMP_FLAG) {
 		flags |= HDA_NID_ITEM_AMP;
 		if (nid == 0)
-- 
2.43.0

