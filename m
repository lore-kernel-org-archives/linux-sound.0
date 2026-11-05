Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875429;
	b=Id0bXy06I8sAv1G795jFMjUDZWLcBN6OwBaI2VCkcW84BTBaOMkUOYKbmgvYhEfHc/0A
	 KYWS+GPLO804O+QCCmIvOOqx7az6OScQ1BtAC3cfIqCz5ggNWb/fz1MvbZshbnGSKfMXU
	 rHoNlg8e6t0c8ZlneBNoPOapq95duyYy6GvqGuV91T+9YKSB2AKJfx05c+snvOAo2PVWM
	 YGf88GXkaJYVqW7EsTzmofZahPPv6TQ6LIFBZu4A5upwim933UNG8+c0dWDdUHwnaLS4N
	 oDA1cZRGi044gooZLwNCjYkgwoEVdghcCOrkOYphcW1aQHgLQoyLsKNesy4Qep1F8+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XIRj/VHtFRarv0lZNWmzV0C1FzshlGUywm6oQSCzwkE=;
	b=xTe71jbgiSrKOFhhVVh3Awdbnz6ob4LOpQLTRZYgME6jS5iaV+6t06otMs3Waq/o+gdD
	 k5tfxDmfxEg8PAdX5eyEVQSviCwR9xB/0ZuWAmNUegKl3tFfeet8BOhY1BstTRYd4doEz
	 xi1g3Lua8N+SFfLUKghzo+UGys6ZUKVpoxaq2I5lRZjUu+dsprlixSNTTqTGtXMs1hkPZ
	 Nyl6tOITo8kPHnjF9rLHgHh4JIIRkCIQZekTFolIDdXgGbSh/4sCruO/lWkQ7rzUcSfZA
	 MQrb9xvUKEjWK8SJP5NId8y2b+gL6GAAqrawaGgpQGQijpypGhNPdKoV0zyFKxwHV3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eejIlaPH;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460F1606D80C
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 10:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 460F1606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eejIlaPH
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so1990060c88.1
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 02:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875428; x=1794480228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XIRj/VHtFRarv0lZNWmzV0C1FzshlGUywm6oQSCzwkE=;
        b=eejIlaPHoVCdN+3ll6UyV4g0vciZtl0gpdogZFJ21OwGNoqux3wetKknXg5Qjh6Yn4
         kbqdMhXbY92b/8Gnb6duxvaFK9zpGGXeShusSvmVvODyferwCxJ5CGYD+Phm9sIxzzzN
         4aRy10JDjXagAGn7ZHjdeAbsh3uLu8sV/EzarHAr6F5GJzbQrksG4Erqz1yOW8h9UIX+
         thsPAq2LUvAXn1U9Z4treehgUjMtqM9hhA5+g6xueaIz6oDJ9KOv67rElf/IZd4u+CFk
         GwR3w0mRSTqgjMHBd89xJ1PMlcYAn3gAHQ7vOPrykqzBSeP5kJlZR5zfs5HeOS69h4al
         eJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875428; x=1794480228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XIRj/VHtFRarv0lZNWmzV0C1FzshlGUywm6oQSCzwkE=;
        b=AusW3WXagMkt5xPWZ49kxFZ/4AH5rbCKA0IhkUrsHIcNpYl7Fppot2flGU8bfelhzH
         TJ0Dw4/itfQkiVVxKJutRzfqLtsWTMU0Q7mhzxLHrEClsBQhd9/TMxrpkcj55o8P4b6e
         09kI6ocZuZyfswvy2znVflMBKnbXuK4KpTW+TIOYIyEA6EiZzxXtcfxTOAArFy4V+5oC
         mCBjJR2d6fDwwcvwoh/GGmI8y4Qt1dwytFejQXj3g9bKmycEVFLsobxTDm0kp8Bk5nP8
         sNFY2Bcgn0DuRJSYG5F1bMt7llD3nZh9GS1+DZ7Fc3Y3UtyVNvVIL0jlceNQ84bG4XYR
         84kQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDX+EHuo1CKJBQxAApQ1UytrHdp0MywLxVCJdp21K8dwTUbuK2o70LysZkSDW4ZMbo6XKKyr8AK3Eb2Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+kYU9mFwe2iZmezvNoPY03hDnUgU3Akg7iHPxwNMP/NdeH6x9w
	XwDw/KUOEu/NRngah20kuoQw7BTFHh6Z9LWxgqzuNOBqsZt+oHSjFjgM
X-Gm-Gg: AYBFou3gm5JyICkHJx6DFXAUXPq60t3X/Hp4J+Y7qkIqCb9i4hOeUvhisLMyUhEMPnD
	3s13+B1wNau5ljmdIXdQ7feIgrxMRPKI2Gog1JmiLtO1CiCVlF25E/LOQEHEvIwn+jJiPAKQUEb
	H9TJbvzYyQ+85TUdo7T4tyu+dNfhC44kqNpYzt4zWX8jw5ZV4vgJkh2JPW+uipoeOwgtAX4duHZ
	fj+RlPAg2GECt/RS0vVXy0rf21Yyv+JG75+YeWb8CtcuTnAZqiRP8pTcfEI5hGP7RIijmCq3YEH
	ZBwhkiCxHYZcxO0uLxlhQA1R7YpOXShBkXlr4KlVbvSFikNlQADqiySFKHxqr9oPUQZwcTRgrvO
	U5NaaKJFHsSkgAVf2yqU4n17N5tTEdDZaBKvmkyGINnEZ08KCUj75odUyF/xf1zUqzER3DP7Qrs
	/7znZetJoj8BVCQ5bbe4pJ8NK37YmJXqv+ZkbcBTMsEDBnP0DaWSsPGwCnCgUoMsp/clpHwtHJo
	pD7DE5DUQYnA5KQKnNgpnt9w6dCQ2i7nFZ1MvnMkcAS+ok7ksO83bAQr1jnmureBrBfKL1+6+37
	yOIlgh95E9hO2yMARpHkCSyz6VhEFU09T55bsB9L6/x2vkT3t5jrjKstCvlJfRDOCMXQ+IgVrow
	4rkQmstgUaHKOVxg/CLbGZD9e3Vb+c/+lRLwnulDWX26gJr300fy992aL7PoXmA0lxQ==
X-Received: by 2002:a05:701b:42c7:20b0:1b0:f0f5:e38f with SMTP id a92af1059eb24-1b0f0f5e3b5mr20779490c88.34.1793875428330;
        Thu, 05 Nov 2026 02:43:48 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm15595215c88.8.2026.11.05.02.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:43:47 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 07/10] ASoC: fsl_sai: Clarify fsl_sai_dir_is_synced() documentation
Date: Thu,  5 Nov 2026 17:42:34 +0700
Message-ID: <20261105104237.38542-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105104237.38542-1-phucduc.bui@gmail.com>
References: <20261105104237.38542-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The summary line of fsl_sai_dir_is_synced() reads as if @dir follows
the clocks of the opposite stream, while the function returns true
when @dir provides the clocks and the opposite stream is synchronous.

Reword the description to match the behavior and document the return
value. No functional change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index f75a1d61d7b7..25243b6859d6 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -88,14 +88,16 @@ static const struct snd_kcontrol_new fsl_sai_timestamp_ctrls[] = {
 };
 
 /**
- * fsl_sai_dir_is_synced - Check if stream is synced by the opposite stream
- *
- * SAI supports synchronous mode using bit/frame clocks of either Transmitter's
- * or Receiver's for both streams. This function is used to check if clocks of
- * the stream's are synced by the opposite stream.
- *
+ * fsl_sai_dir_is_synced - Check if the opposite stream is synced to @dir
  * @sai: SAI context
- * @dir: stream direction
+ * @dir: stream direction, TX or RX
+ *
+ * SAI supports synchronous mode, where one direction uses the bit clock and
+ * frame sync of the other. This function checks whether @dir provides the
+ * clocks, i.e. @dir runs in asynchronous mode while the opposite direction
+ * runs in synchronous mode.
+ *
+ * Return: true if the opposite direction uses the clocks of @dir.
  */
 static inline bool fsl_sai_dir_is_synced(struct fsl_sai *sai, int dir)
 {
-- 
2.43.0

