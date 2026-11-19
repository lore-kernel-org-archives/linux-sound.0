Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108426;
	b=OgSzsNgHp8vpOQR+25BPBDM19lz1C+PrRFGg0jh4Po7Rteb+FtgRHyhoQGKy0yb+PkQG
	 4DNdR2MrT+aRQxdYTG3lJyNjhYuwiqywbUAzP8/sjCqQoYrNJLoAEptCRrOCB81SICR8P
	 2XYEZLw68Ih3f0SvHyTXdeYtU8gqDteVMxZRXBNErDX+Ycg6MK9AynJsxfsuu45LoAv2g
	 z5J7QfVlp4wRjcSpQHMbRQNjr3DKRSz3k18RaVscLSau9RiNI8bLi9zeQnVIvdacNvP8M
	 AGUGydj+PfgDMvJ0r9K8LeMhVxbNAVTzgnbJXWnoSM8SSd3sEx6jRDNubUrwupRHjPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=6QyjNsTJ8Pk5IbHY7V8NIIncLAiaHTchnKhUzfM71SE=;
	b=5ptH1J38BbycrHBxh27E2V2CTTj20Q8eHzfAJdiAvSr3fsPDbV9fT9+u22TNqAuImZrU
	 9PtNn9OZC5F9m+juwICGXTZgLduUDMu+cFH9Ndb13LwxAXnDSCdyfpTETrmk7pY9ajha1
	 DWhFI4/1Q8C9f4tH1J3xOBXzZHFqhS1sOOjDAIgxw9x7BjH15LftCPpJd1ZuYEOQFEKzw
	 SyA90XclqYcq/HSvAXwuyOcD7as5yAWekk+NmYHhK5+cbwk/aKNmRWWhU9TtJqd3waxYY
	 ilJ3eG026ZgS6G/sn90ZVIJRQmJt+SHSmPhzWtO/EinfvX76Hc5C8UnKS2Yh+7i/+eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aBA2aq7E;
	arc=none smtp.remote-ip=209.85.161.72
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA677606A332
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 17:13:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA677606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aBA2aq7E
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-71aca016fdcso2490347eaf.0
        for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 09:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108425; x=1795713225; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6QyjNsTJ8Pk5IbHY7V8NIIncLAiaHTchnKhUzfM71SE=;
        b=aBA2aq7EnEA6yHGj/0ZUiq0xOwLlmcon9EQykkxd3ZRunYXC9X2/87mCoLtG3ugMqp
         d8ZeibN4bEIKokFmnpNaMJ+R2111YpmWe9riMAzNWU9h2vMTKH2k6eT6Sr+ZsD+wCdkR
         1iN6TMiIghKC+8tHsAsXfLLZercKERSJzDA9GdZ8T21lpfUVLJLUbY2c7Fg0b9rKEwC2
         dgfEsrflpeQtJ6DHdmVToH6wy5f/c9qGLWeJteffzB8cWCm02Qm0KDG3bTS3iifoDBYY
         9ZxcSkc4K46uSdpm/o0e/quHdGQ+2kO0VCVxwJOXxGUVLcDTHO2G56gHzrsZxx/t3aTv
         fCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108425; x=1795713225;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6QyjNsTJ8Pk5IbHY7V8NIIncLAiaHTchnKhUzfM71SE=;
        b=CoqISdGbswXjNYK6VTOpbdueD7Tguff5Vax6Ed89F+budxURsV+0GKSPAuz1nW1adI
         vfAUzQMZRlhHKM9XnRq/+PRS5xj68p3jqm0EuqUnPW4pVfGVO2DQe/W8ppgzCBC1RzCl
         1wFGYquqm3S1PTf/vDutjJKaqllgZO6jw1CcjgoZZtZi6oRkv8VD4IOUeXSyxTX99Fv7
         LmS23gXCOkcRHc1IFBVlwX65ptrW7Lui3zusKdfyaVK3F5YpSgyxq6G3/O4lCYGp2cVq
         BsBQ4wq2F9dtnDMj+FRDYhlPP0RouNUhQ27lk2ce4vFIDym8Lkc0Pfil9GCNuTvBwrgL
         T1LA==
X-Gm-Message-State: APuU4Z/zRkqHY4uwHuMr1GbQ/aGXE8bSHJ1QMb5q4QHKfbvDj4FzORLd
	r6WzvMnKI5BHOQ3Y/rb2OGallIMhKEyHiWI8FGId+dGHeILaV9tdlrNfp+jOgFbYV4pt4/8hipr
	26G4z1u1QDw==
X-Received: from oakd17.prod.google.com ([2002:a05:6870:3231:b0:495:bb4d:1619])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:9d98:b0:442:175:cea7
 with SMTP id 586e51a60fabf-4bc7beb0334mr203879fac.1.1795108022773; Thu, 19
 Nov 2026 09:07:02 -0800 (PST)
Date: Thu, 19 Nov 2026 09:06:56 -0800
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170656.1522183-1-irogers@google.com>
Subject: [PATCH] ASoC: rt1320-sdw: Reject unknown dev_id in FU Capture Volume handlers
From: Ian Rogers <irogers@google.com>
To: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

rt1320_sdw_init() registers the ASoC component and its "FU Capture Volume"
control before SoundWire peripheral enumeration populates rt1320->dev_id
(which starts at 0). Unlike rt1320_set_fu_capture_ctl(), the
switch (rt1320->dev_id) blocks in rt1320_set_gain_get() and
rt1320_set_gain_put() omit a default case. Reading "FU Capture Volume"
before enumeration completes (or with an unrecognized dev_id) leaves
'regvalue' uninitialized on the stack and returns a value derived from it
directly to userspace; writing the control similarly reads uninitialized
'regvalue', 'err', and 'reg_base'.

Return -EINVAL in the default branch of all three switch statements,
matching rt1320_set_fu_capture_ctl().

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wconditional-uninitialized; not tested on Realtek RT1320/RT1321 hardware.

Fixes: 7bf9e646af9a ("ASoC: rt1321: Add RT1321 amplifier support")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 sound/soc/codecs/rt1320-sdw.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 20288ea7a2ff..19f7aafc6f2d 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -2672,6 +2672,8 @@ static int rt1320_set_gain_put(struct snd_kcontrol *kcontrol,
 			reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
 			regmap_read(rt1320->mbq_regmap, reg_base + i, &regvalue[i]);
 			break;
+		default:
+			return -EINVAL;
 		}
 
 		gain_val[i] = ucontrol->value.integer.value[i];
@@ -2702,6 +2704,8 @@ static int rt1320_set_gain_put(struct snd_kcontrol *kcontrol,
 			reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
 			err = regmap_write(rt1320->mbq_regmap, reg_base + i, gain_val[i]);
 			break;
+		default:
+			return -EINVAL;
 		}
 
 		if (err < 0)
@@ -2760,6 +2764,8 @@ static int rt1320_set_gain_get(struct snd_kcontrol *kcontrol,
 			reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
 			regmap_read(rt1320->mbq_regmap, reg_base + i, &regvalue);
 			break;
+		default:
+			return -EINVAL;
 		}
 
 		ctl = p->max - (((0x1e00 - regvalue) & 0xffff) / interval_offset);
-- 
2.56.1.708.g77570a6a1d-goog

