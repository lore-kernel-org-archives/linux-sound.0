Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6918528E
	for <linux-sound@vger.kernel.org>; Wed, 19 Mar 2025 14:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396214; cv=none; b=dLqIOS/JoYWoXOSduFRJ8OyreoDKEyRKlMlkYFgK9oNvRZRiH2FJQnZoGuTyhlzP+bXETokl8UvOWHvjrQTjRsoo5c4WorQMypuvgGpQnOLcl7hNNsd31ispVXAu6BfmGLVUU1/Fw3ql0u7+ok0oeCKfeKH+UNxhTGw9Aky37yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396214; c=relaxed/simple;
	bh=/FvpnxAzD1VmTQTseHZhWOrWhWYFaNJQSC/pY9vT5w0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SFjSeK+Dgq4Y5FGdM5I+bJOQHUB2dvu/8rO0mOWZ/EzxeU7fJt4ZEhiDcFA7CGbiPw2E5rAL8CB1gpvoU9d2FznpER8CGeHpycnsqwK9kG7Ex2TZBisrzbTJ3iQ80PKDb8eqemHml9JE3AU/H8arFJyZ3F/6FQQaCaZjY4r82kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVd/DF9W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVd/DF9W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A358C4CEE8;
	Wed, 19 Mar 2025 14:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742396212;
	bh=/FvpnxAzD1VmTQTseHZhWOrWhWYFaNJQSC/pY9vT5w0=;
	h=From:To:Cc:Subject:Date:From;
	b=HVd/DF9WjKEiosXUilT+Faui2F2sOkC3lhf98E8MD4iiITK27S9pKB5C9uvKJUavb
	 q9ib/PtJ5lP1BjK0OzR4lxb+g5MslCUKdBcjZ9TSqoIF2xvBoJ/j+X34wnHHTtZzgI
	 Mr0E5dTSbfnWct/S1PPz9jigs0jMhDFcXLGG3gtR7KUQhFAuHgRrZGnFTc8zt1yldW
	 KvH8/ghRuJbcm5KbHuRlgqjUoIdM3nKtwoopHwv7Ucn7SJQmsmqRhh0k58W3+c3yZ5
	 vcYP0Fh2szdrmpsaL/gHDgkTmxAsKuI7Rkd8KBWz1z1V3V01Eg7KY1iFRwA60a5LbW
	 S9HI3cOtTl5Hw==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	olivier.moysan@foss.st.com
Cc: Akshata V Unkal <Akshata.VUnkal@amd.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: dmic: Fix NULL pointer dereference
Date: Wed, 19 Mar 2025 09:56:31 -0500
Message-ID: <20250319145636.2401680-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

Regulator support was introduced in commit d3321a20b5111 ("ASoC: dmic: add
regulator support"). During probe `dmic->vref` is initialized with
devm_regulator_get_optional() but in the error flow doesn't get cleared in
the case that PTR_ERR(dmic->vref) is -ENODEV. This leads to the following
NULL pointer deref.

```
Oops: Oops: 0000 [#1] SMP NOPTI
CPU: 7 UID: 1000 PID: 1587 Comm: wireplumber Not tainted 6.14.0-rc7-next-20250318 #1 PREEMPT(voluntary)
RIP: 0010:regulator_enable+0x17/0x70
RSP: 0018:ffffcc10c1fe7a38 EFLAGS: 00010282
RAX: ffff8bccc1c25010 RBX: ffffffffffffffed RCX: 0000000000000000
RDX: 0000000000000002 RSI: ffffcc10c1fe7a38 RDI: ffffffffffffffed
RBP: ffffcc10c1fe7a68 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffff8bcccd51f800
R13: ffffffffc1086e88 R14: 0000000000000001 R15: 0000000000000001
FS:  00007f927bc35800(0000) GS:ffff8bd44f09f000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000065 CR3: 00000001332c6000 CR4: 0000000000750ef0
PKRU: 55555554
Call Trace:
 <TASK>
 ? show_regs+0x6c/0x80
 ? __die+0x24/0x80
 ? page_fault_oops+0x154/0x570
 ? hrtimer_start_range_ns+0x142/0x4e0
 ? timerqueue_del+0x31/0x50
 ? do_user_addr_fault+0x4ac/0x880
 ? exc_page_fault+0x82/0x1d0
 ? asm_exc_page_fault+0x27/0x30
 ? regulator_enable+0x17/0x70
 ? __schedule+0x491/0x16b0
 dmic_aif_event+0x82/0xa0 [snd_soc_dmic]
```

Adjust the error flow to explicitly set it back to NULL to avoid calling
regulator_enable() with garbage data.

Reported-by: Akshata V Unkal <Akshata.VUnkal@amd.com>
Fixes: d3321a20b5111 ("ASoC: dmic: add regulator support")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 sound/soc/codecs/dmic.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/dmic.c b/sound/soc/codecs/dmic.c
index 5d3c3f17c6d8d..61e1bf1b3c9e6 100644
--- a/sound/soc/codecs/dmic.c
+++ b/sound/soc/codecs/dmic.c
@@ -114,8 +114,12 @@ static int dmic_component_probe(struct snd_soc_component *component)
 		return -ENOMEM;
 
 	dmic->vref = devm_regulator_get_optional(component->dev, "vref");
-	if (IS_ERR(dmic->vref) && PTR_ERR(dmic->vref) != -ENODEV)
-		return dev_err_probe(component->dev, PTR_ERR(dmic->vref), "Failed to get vref\n");
+	if (IS_ERR(dmic->vref)) {
+		if (PTR_ERR(dmic->vref) != -ENODEV)
+			return dev_err_probe(component->dev, PTR_ERR(dmic->vref),
+					     "Failed to get vref\n");
+		dmic->vref = NULL;
+	}
 
 	dmic->gpio_en = devm_gpiod_get_optional(component->dev,
 						"dmicen", GPIOD_OUT_LOW);
-- 
2.43.0

