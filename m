Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79984417355
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 09:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405282; cv=none; b=DpkmCbsdq1wZ5qMWFhtDvG8h0rlqTaRjbt+zpwk925u8AfTCv+zGCvezBDUxsVllU0cejsESzle+D6qJmoc2F8ag4QRCC7Cmj9XEZVc+4OH7c78odylrargXmHsJqVniYqslYx+cU+2oiM/15FJMm39xb2k2tgHHJ6ckkBssgQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405282; c=relaxed/simple;
	bh=/gXKMbBuIe/nzXJIZ380fTPEnD4T8QBEcymvrfjUGLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G/VRm3RKSVAI5wbznGDPhlA7lJN0hV9SVH+DVSzlKOHAkXe8F6mg2U+qF9Y2IRGnsx7WEc6Z8Bx6wWzVn7OqpOWRgCms/lxExVzLy2WDcXchZA7Ncb+QQd2VIefPsMYonharGKgA7eWSKSHTVxQCcL297e5EnpUysFwCK4gXh8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwGlULbE; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwGlULbE"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d01663d816so17249415ad.1
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 02:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785405281; x=1786010081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+lKz/SlGwXmAhLGWuO3fxWgDmJoMay2AdJkxbT6UZVs=;
        b=QwGlULbEBRFVWxJ/QCwFNnyrYxNaPqBUJv2H7lGH9DEQaccUjTX05JSSsKMiTcN/pT
         HGHJGv4PTw4kRmwr0F4g1aoKwBKIg16qLULniWc06TRJjdx7nKTaeswDw0ro+o3Nf9Ca
         /FebpKF7OcpaAOE+k7nSMUeuh2WoBUGyotJwcMp2jACfTHVDDZaK6w5+q0T4DAydQq8K
         MhgzfSGbckjlDB4LTKRhbOGzJT9/+e5Sn8A8kLLTyciS0sQY4KifLYl5O4FPyiM+L4oU
         qsnS1/sBLG6+91NWZdz8r7tvnul40K8kbaQ6pZzPwta97lm1mNSsmibbAXSu6Hm4+wS4
         gfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785405281; x=1786010081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+lKz/SlGwXmAhLGWuO3fxWgDmJoMay2AdJkxbT6UZVs=;
        b=cIKNFPgLJR1Am9paeAFeeyF2YoafKPqwCYuArV8CLb/eirtmgM3jKeqGxc+dfUkxtr
         YDEqIvdycj+Albd4M3JgmAXMB9RZwDZyhZttLIqVDEvaUl0xjJtwWfa7jkNnUS7KWD4z
         TrapOM0jyiQpn1DJXA/3yamuAVo2FH6B6xZA+mxKnvWOfq38e6gXnCNRxZbqo14my/hJ
         dxOLPxWkhHnKrdS1rFhnV9Znb7NrY9hQw063KlEdNJmYQp7JPlxDXpNg5OJUfKm5p9lq
         QQrL6pAL/IFTbKnp9dkWCGIqda899ujuql6mqJk3GA6Y6+8fdyeTt4ligCIIpCrhDmK0
         iiqA==
X-Gm-Message-State: AOJu0YzQm2y7RauBTBmwMTjylE7nyrQLnOrUEyNnmFWz2XXEoAlOeXea
	jVLIsaLnwlqKksNoi0owH7qlUObT0HjV4enle8ejbc7DeRRn9siK64fV
X-Gm-Gg: AR+sD13yuE64I135qYG6BexslNQydbwmcSt710w1ksjFATjmWBzEwV8XDwLNgt23RiV
	l0FT1JsIlnucphf7fgqaeH+VKuMUc5pIoTzwemg30jQoMeIx41wJyAi4PK/RiMKrymk+HvIh5NT
	rk4I4d4n+DCc8gtsHU4pIpaZcUiuup6luvhVZhXeOLjRn9NCIk3ZXK1gr83cakl4e+aA4LWFMhB
	vI2kiKgvfaSct8y3bRb7m/+cM7oaoT+tkWRpenhYV7PDd8GdoEKc6UTl8OJOqHjDpZL2pnIBz8B
	2MpklBd7hrOuBVYTuV5H6CNSSdmlQzxFWb1niM0qHwupgKiAuj6R+ocALppfrdcQAsmvLzyZfxs
	FMhqrD+7QSxQhA3r/FZPDGN8pX9lGYmL18d9Mi1VLeFlH0QYDyjkonLViAYEbDFLORFvrI09WRU
	md7iPQxgkJTZlYpjeEndwt/EOGCk+DZF9ywnt6rOEAVbijPPHsbb0lS21bWGPXvMWEgzVeNyZ+E
	XIEz5hC0hKC+aczk5FxnS/CNjJ5scvXAx7CbA/NEaM0BrP92Ya2n/f3dUeDWQ41U/+PjEEXkk6c
	XwR6
X-Received: by 2002:a17:902:c943:b0:2c9:97a7:f544 with SMTP id d9443c01a7336-2d035cfc878mr18082985ad.42.1785405280827;
        Thu, 30 Jul 2026 02:54:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022c2dfb1sm23982345ad.72.2026.07.30.02.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:54:40 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Tim Bird <tim.bird@sony.com>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/4] ASoC: spear: spdif_in: Move DAI probe callback to snd_soc_dai_ops
Date: Thu, 30 Jul 2026 16:54:06 +0700
Message-ID: <20260730095407.33894-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730095407.33894-1-phucduc.bui@gmail.com>
References: <20260730095407.33894-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The .probe callback is no longer part of struct snd_soc_dai_driver
and is now provided through struct snd_soc_dai_ops.
Move spdif_in_dai_probe() accordingly so the driver follows the current
ASoC API and builds correctly on modern kernels.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/spear/spdif_in.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/spear/spdif_in.c b/sound/soc/spear/spdif_in.c
index d571055bfc6b..dd1e176193af 100644
--- a/sound/soc/spear/spdif_in.c
+++ b/sound/soc/spear/spdif_in.c
@@ -150,12 +150,12 @@ static int spdif_in_trigger(struct snd_pcm_substream *substream, int cmd,
 
 static const struct snd_soc_dai_ops spdif_in_dai_ops = {
 	.shutdown	= spdif_in_shutdown,
+	.probe = spdif_in_dai_probe,
 	.trigger	= spdif_in_trigger,
 	.hw_params	= spdif_in_hw_params,
 };
 
 static struct snd_soc_dai_driver spdif_in_dai = {
-	.probe = spdif_in_dai_probe,
 	.capture = {
 		.channels_min = 2,
 		.channels_max = 2,
-- 
2.43.0

