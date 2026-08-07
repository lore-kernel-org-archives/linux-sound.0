Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5E635F5ED
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 11:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102942; cv=none; b=YaDyh/lUV9Gm2lMj9YNzfN5po+Qk7jcqryHg56xv94VfA9E3AD+7xjvc08bypWxTqju1OlpLvWunsh7SATxAL54/GVUY4HWyw6s0/VU/k1gJs6IwM7mLxBHdq19xBgkuJcoFNhmIwC7GK4UDuEYwNS7KF+NtnRX59Nv+brtmP/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102942; c=relaxed/simple;
	bh=G7A9VyBzNW+ys4oCdJOqO6Hbk5F6spxIfIbUNWzCj3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZUJO81hf3dc48B+TyfFishSGOOBkiL4mbyL5o7QBy6Z6K25Iy9cCvdsge9FN+WVQ5U+7VnLMfIofSa8o3UgtJRSffHKi3yeONhSNYfeVHlVVCASmb5b27kYBWc5pgPuFuLxpPP554f+RGZXSinsXw94tqrWB68R00xKocXelycs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rwlY4ouh; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rwlY4ouh"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so3589175a91.0
        for <linux-sound@vger.kernel.org>; Fri, 07 Aug 2026 04:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786102934; x=1786707734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0tFaoWtzLU8DJaY4QXu8kIEx2fyiCWG7Fl24BOjON7o=;
        b=rwlY4ouhlCHd5rNbVTN7xCMxAogISPGbN7q7yOKKj6IFYH5pSPtdzzewkf1ZT1LUF4
         UJ2E0NBKhJVF6WGA/fePCxs9xF8j6KjuvSNt+pQ4sQjcc86iBwdJb4ceiKRQqLvB1ac0
         YldxprqgyJB847zV91zVMpmWihtBPziqi+lg4fONj0FOTaua2+rqQcUIwh6w/Jo0FhpV
         cVtjmXSwV7GLNTCcNUMb9X9JhcLl1lDXCoxnjHXTcxgh3NBRVuSZuCfgwYpV2rwpxzca
         jcm2c6pqrJSvWpDzTHBO6WWESJPLfhbxbBjUAYD9pBUQ+RkeX5YCa13YGcqPEJIeLsdv
         /DpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786102934; x=1786707734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0tFaoWtzLU8DJaY4QXu8kIEx2fyiCWG7Fl24BOjON7o=;
        b=k8/dXejuXKY6L3Qnd7Sd4edz10QZKvSil+V0wbY+BFzZG4za8cy91kHPpDBi6O78wU
         he1vjnsocn+teAL/vIj8lBCR0MUiiwbXE7KGakFcKz3hcd6/92bHhqbZdc+qMaWC7hwA
         eFiE9PUuz42BCPuhV2J+lt0jmYKdQ1B02wimWCCddH2zRDzA7yGH2d8ua0oAiXkk1A/N
         egIbvR0y02A2xMLgGbIoJFFqnM8qB8k4skbvP2lYZzhnVWB77Od/A5bPWxUI1raplHf5
         aJ2F3jazR9MOwIGAjUjuuO8RjmzK3CXFdn0+seeSIbay3r03CTjBL16THyg3mq3oXRb8
         lztA==
X-Forwarded-Encrypted: i=1; AHgh+RqXeJ4gCS5B7f7tcPclYoBtnHqKAsz0f5FJpOe6opa+wnaVNYJ7sw/AE9yH4nR25Qi3GAFq7GbePQUy1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQkJPPfcVJddTs7W2fgDrIACwPfx2OOFF2KW2/SbHmsJAZIMCU
	ilPZHPg114cHgEs9sU/cUsPBohOmakHsqF6fPftchkLgwLhTfDRNdajA
X-Gm-Gg: AR+sD13o0IflOEUw0I6z5g/n5WIkoVLpCWb5fLlgHMmpJPNod8dBQ8a13C0jsLOR/+W
	hkHXywjyFPwPACeppkhx4ovyjwQvMeOSNSk4oxXPvDGgDPv6S2h94pESCPfvogO009aIaBMsNa+
	AmFraHvyQQSqbXsCZRGXTjki2fEVf/jdtfKZHeimVhhuQb1tcAEqld1OBNPxqcNskKm3I2fuObS
	oo1lGtHSCz9X3sdctmYJaKxePnaYxYzVTliMl8RfM1umx4rzgVr0/LbwKA0lk05tNylPMCge1Xp
	NU9sTn7kUctdfhOM0An8+/8hI2b/CSt0zVSLs1WYUIuhdzY5Z+sH+kOOj57564FEcM5vsM09sLq
	TzQPz2k1Ln7+TTD+CyfC7d9ffo5H0Yp7ko7t3TioKtkcZLOzOHdX0BY+0UY4Z0rvPPxGZcOE/AP
	yISUQOPL5sl9abjIVhAZw23ydUalDDITJxmGgR9QP3dtMzMb48fNHL4Dg7gfrJEJLvLEUHg1RqB
	FdHaqzUYEo=
X-Received: by 2002:a17:90b:4b84:b0:38e:8021:2ea9 with SMTP id 98e67ed59e1d1-3903c5f6482mr20137207a91.19.1786102934189;
        Fri, 07 Aug 2026 04:42:14 -0700 (PDT)
Received: from localhost.localdomain ([72.255.58.127])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86d3fcsm6930508eec.4.2026.08.07.04.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 04:42:13 -0700 (PDT)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH 3/7] ALSA: cmipci: replace strlcat() with strscpy()
Date: Fri,  7 Aug 2026 11:41:35 +0000
Message-ID: <20260807114139.1661-4-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260807114139.1661-1-mahad.ibrahim.dev@gmail.com>
References: <20260807114139.1661-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "-SWIEC" suffix on card->driver was appended with strlcat().

Take the length of the existing driver name and write the suffix at
that offset with strscpy(). This is the same thing the can_multi_ch
branch immediately above already does, so both arms of the
conditional now build the name the same way.

strlcat() and strscpy() both truncate at the end of the buffer, and
the suffix is written at the same offset either way.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 sound/pci/cmipci.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index 9d9f784e3a8c..c8d98d76b689 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -2983,8 +2983,12 @@ static int snd_cmipci_create(struct snd_card *card, struct pci_dev *pci,
 		int l = strlen(cm->card->driver);
 		scnprintf(cm->card->driver + l, sizeof(cm->card->driver) - l,
 			  "-MC%d", cm->max_channels);
-	} else if (cm->can_ac3_sw)
-		strlcat(cm->card->driver, "-SWIEC", sizeof(cm->card->driver));
+	} else if (cm->can_ac3_sw) {
+		int l = strlen(cm->card->driver);
+
+		strscpy(cm->card->driver + l, "-SWIEC",
+			sizeof(cm->card->driver) - l);
+	}
 
 	cm->dig_status = SNDRV_PCM_DEFAULT_CON_SPDIF;
 	cm->dig_pcm_status = SNDRV_PCM_DEFAULT_CON_SPDIF;
-- 
2.54.0

