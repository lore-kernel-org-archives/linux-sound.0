Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD223EE1D2
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288670; cv=none; b=A2ICXJp7SZc8SR/fTQeM7wLkKR0LrKjm25SA27XNg7x7xmLx9VaENxBEFT+6B3LyQKVnAmzbk10xZ6YvsFR1Bx1DufBLe0lm4TepEGXn4TqFu7QM3FWTE7LnH3SStRwI4GdcmLJIWYlypB8Y+SvS4h+g/nsNx4Yngru2ysLBFAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288670; c=relaxed/simple;
	bh=CYDldYs/XfyHeESUEuZgI6zHvpGVRgeHUmWISgsC1W8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hags39zAHVoKuJAxca4yak0DpiIIEv8y9dpM5wZVipPZVWhNynCzGkxDXpsO9g9gz54uQLtbnim+/hKg2cz4C/b21vqV+R7SpqVY2M8iBHF2+5bS5sLYBWIfNe4ItxXaYXt0YEDIU0kjeI+55YMwIfjnQ/4JzgDO81uhb3E+ODQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rHgxQnT5; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rHgxQnT5"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-134fe980658so6508745c88.1
        for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 07:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779288668; x=1779893468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1e7cb5PYNRFBDikndRC9Bh+f5WtQR2K+GB3lpw9q7VU=;
        b=rHgxQnT51bD5vjSDPDqI4VGkm+ZnYe858C0VsHuLW75Dg9MeXuzUUwK5aOFQ/xEgSY
         OqHL4r6F8O5kXPUP6Wyq4lxRTsge5E3WW7YXLk0k0id0Tr9beS8XSi6qYyrUpRqYL7Oa
         dLogLyv9pBNi9B4dHYG+ZIu0h83aw97gWtiLonAopdR0Iabz01abZ4ghSIBfLo2HhCHU
         Jow/PrVH8k7BaoCHg/y6A/UqZLirRTvOseAc5AE7TiJkddiuBlg//EjWDOQihLSoeZ9Y
         gjoH39zPtDxPq4G/yKpIX/QixlroWKVY3mfyOMdtBXA9hQg5awuAM6YCa7ozISgxjsW2
         RA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288668; x=1779893468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1e7cb5PYNRFBDikndRC9Bh+f5WtQR2K+GB3lpw9q7VU=;
        b=aSwTto6BQrox96HGog8QbDLtje8Mc5Gz1Daokb+qVvCpx+9pa7BG2rUABKT7voSzgn
         X6d9Swx4cFldRr3D/JfulPjwZjMDMZL9RXKSXRDa76+6tFv4eYDebfAheT9TJfOUs3uc
         49M9OnkxNuz8YHfcIp1ywQYDxS8Y/Xq+21hH12hxWXnrDVWT625y89TliTRIvwrGUKlv
         o775Q1RmKMxMD7GzYFDHHDRNjW40xzgzn3emJHeQSUKZ1RDn4NVfky1JqpvZEYhQ1T3+
         NgqS0Omrw2dyOeU/utELyk5LWtF3dVHeYYpba1ncVBaQ7ZRCwYb6kYEel1lIR8HrAp1C
         hZKw==
X-Gm-Message-State: AOJu0YwVHrcAXQzQSUqyx7rxt1S0DGzFKtNZvXXTCVuCQQtAC+qy+3ue
	HWM4mve6SVIyRO8yW859Uqll+CjUwR1kERCp5ka+FHGB+1/TPE4+jQ+x
X-Gm-Gg: Acq92OFfrvsIT6FuJp+qgfhNWX6XHBeJD4YYSs+k600TVY+LU2LfwAi074Tmy1wmxd6
	ETHmARgkYjU7f3Oy/6XzsPHiMCWJ/5/MEIkUCA9UlVEU/jWaru/TzvYN75wYkHgWY+xQrWplSau
	3FFxQ02VlqbHOvKw7PV8M0HxTOqEzn1a+eO749z04ePsvufmUMcTFOp5iNLMAGrcDUWiNXUJpJw
	Fs+ifdZKIP1mPodK/VOW7sbnVtcZffBk2bcqUA0n7ITnyMiuIVbhSn+Wxsur/Jq4FzrWVqCPFRp
	iWXj4SeuvrVlSTJNIHevxlaDjlB+lo9xOP90Os/Ipt/vzGgVnrYKT4VHhVNY5+2VT9ckuo9/V1K
	2X+WRUuHmMIk0VF6cIjjwVN8+LZlFb0QXgWLBTY/gd7JnfCbHMpsMCxDJk6Cyx/Klu/aTrjlDbb
	/NyNJYCHJ4GZ1TdC4SnOrbK5jbG/TzOmI8TKOI9Ppj57BY85eQQynekAfRvgw8xv+wJydYm+2vx
	+f1kFqgwYWQ
X-Received: by 2002:a05:7022:4184:b0:12d:de3e:86ba with SMTP id a92af1059eb24-13505930870mr10577977c88.42.1779288668332;
        Wed, 20 May 2026 07:51:08 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm27334864c88.3.2026.05.20.07.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:51:07 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 20 May 2026 11:50:56 -0300
Subject: [PATCH v2 2/2] ALSA: hda: cs35l56: Free system name on probe
 errors
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260520-alsa-cs35l56-system-name-leak-v2-2-60f26c159023@gmail.com>
References: <20260520-alsa-cs35l56-system-name-leak-v2-0-60f26c159023@gmail.com>
In-Reply-To: <20260520-alsa-cs35l56-system-name-leak-v2-0-60f26c159023@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Simon Trimmer <simont@opensource.cirrus.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=CYDldYs/XfyHeESUEuZgI6zHvpGVRgeHUmWISgsC1W8=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFm8pwL/nRBT0zh+/CnL2fwpqQKcx5e7TX74bVn1BN5jz
 YxTxSw2dJSyMIhxMciKKbKsTlpkuafrwdX6uBUeMHNYmUCGMHBxCsBEbk9kZNj/9b/ytuBdcxZ/
 UDHmyCrs/zsjXmPOzxNLXxe5ZzHm/OVl+J9naO19VmVt984TOQ8M25t5WGb/W6Ys975pJ+Mc8YU
 12ewA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

cs35l56_hda_read_acpi() stores an allocated firmware system name in
cs35l56->system_name. The normal remove path frees it, but remove is
not called if cs35l56_hda_common_probe() fails after read_acpi() has
succeeded.

Free cs35l56->system_name from the common probe error path and clear
the pointer.

Fixes: 73cfbfa9caea ("ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/hda/codecs/side-codecs/cs35l56_hda.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
index 7c9c98436757..8130ec271165 100644
--- a/sound/hda/codecs/side-codecs/cs35l56_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l56_hda.c
@@ -1240,6 +1240,8 @@ int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int hid, int id)
 	cs_dsp_remove(&cs35l56->cs_dsp);
 err:
 	gpiod_set_value_cansleep(cs35l56->base.reset_gpio, 0);
+	kfree(cs35l56->system_name);
+	cs35l56->system_name = NULL;
 
 	return ret;
 }

-- 
2.54.0

