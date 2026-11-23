Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795474867;
	b=BaM6qio3W3py2oO/Wf1aZ2rj+LD/bCaG3TDVe/lFHR5HwLxrhQO2S1N+nvd3yFTyWXNW
	 m3BwMMZ36fJljSaeTq1sS7KSP9iEA578n3b7dPSjkSZBz+gbEuG6h4PmUTEjc1iTrx2jG
	 h6lidEKItf9RZpbiAmNmzrUDvOAwa8j7F1n/+Xg9WuL4BU9jRWwxoL03lWmgF/z5ptdcO
	 qUVl8ts+dN6LakFPjFpO5eCZf9RGQBHAEXDoimxNeZsbBcCuSUmfeWQkNPgFsm8i+QYgY
	 Uv18e4vg3vpo/vIuWqOG+Vf8Pe0meGk0/i17w/WE/C9BFvVGHCC3mboyXeLSggLCy4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795474867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=Aqohkn9z53SBY8rROqhjekaytCoqauZetpa7fBs5LxI=;
	b=FYItd9kbDFG3AdVaUv0s/6/YBZdhnkXpc8w9EXZol8WP7bHo69TMdmhqcxi4/grfNakj
	 ekuNAdW+3wpNoUvYk3GfzCA5PoQniC03T25MlXSpxoGNDayRij05saNsbN+8vBgpMJZo9
	 fnGmLzXUG/LUIHrPv7Kwz1vuU7q7KjCunvoGEtBiVYTVDayK5vYETDfVENAdFizXA3+Fl
	 iJ59iTEXCJin2RlTAqS1B6dO1I8/xcsWZ8pL2ZTfC7ntGhqj4uZJ3EVroDTTYaKNvzC/j
	 1AG2y+h3TxFng7e/H9DGJZXvEzq1ZlU3WMUFjWedhmZul5BQhO4/+NVpWLvIOt56zOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sQfnVn7J;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C77606A321
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 23:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85C77606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sQfnVn7J
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-385d8a00598so5411355eec.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 15:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795474866; x=1796079666; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Aqohkn9z53SBY8rROqhjekaytCoqauZetpa7fBs5LxI=;
        b=sQfnVn7JE3591GjQcn8CgenIvgChnWf/Q7F+bGoyzL0ncjbVoQzLnS2v6tXf9eBQzp
         EqdS7phfvIVpWwZ/K3PNphs+sY3bsBXWyHwD8SjQu229DAQ4V1mxGo4+kf/Kih3+dbO2
         RPU63Ynw/46PZJhQsfzGRmIswyGPxz7MRcNiXlwdaViAjMoHsWLPBnEmtnvOkfKggI2J
         7iW2a/i5rigD8R/5GPTBl72X7ln3Qzh/7hR9dm06q/aH3s+F349PkRxSin5zZrEmGPEd
         pvyUo2X/wf8MGbeq5wkUiw8nGHBEgOGetGnnwugrC9EXPX0/wS0Q+fWwl1b4rYjrXoDI
         DNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795474866; x=1796079666;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Aqohkn9z53SBY8rROqhjekaytCoqauZetpa7fBs5LxI=;
        b=2er7T+KoNUTF35lZQH90gkoxl8iOEJN5DIvkyoIsb7HDCP1u3TFQJTfIT0zoavGHDO
         0+O/8/pZNhmxMEykTgkLqbJmAsf7+Ysm2DlI+2wUG/ED+ouEQEWRot4zHtChR+t3oZw/
         KcHWzuqozaZ2bwj6sPG7NfTJTgC49ms35sht0Kx3CLgH9nlG2rQpSNtBjR5C/Ua8a45I
         xaD1Vo0eD2lbg3o9ssS/hM2QQc460/hmqsG8wRCksHpDSWJGYDTtf59veJrYe+mWX08h
         FpWCxZVEh0TeogXhejWIaw8tJ+CosWNqotLuHAp8OqT2QGqni5IXlUUmNsxod9Q7fn+A
         lNYg==
X-Forwarded-Encrypted: i=1; AL+hErH+SpAlKintMPzGaIZOTrzcOxm8Y19RvmvYs4OwxvwOpg6tnlOzYGhX8KCWaR8x7fQEU5TjDTrNq+YNXA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+6/7s+P3EMBByMRowahNQO5aMt00reM0jH0Pxxm4nprQcMikag
	f1Tyz659PYYgW7JAS7dluuSef9s/0tICIBilUZDTlLGBsOwSkmZrlf22
X-Gm-Gg: AZFdTZcVQOd+nTOXmcMlAibYn+e/2L7lEc1nGJM12pBxJNoZxfH6MZc+1+grP2eK/Ez
	CXjiw+ksFMlR+XIdc9ASWRlek3MMVTOqk8hYmi1Tvt36V4SAFMXaTnOcvt9Z3gfGadIcgD9lZ61
	Q8DF3V9lwTaH7bgJHaIjp1coQK10zXBFpr0MwvryJ8hy7ZmHWQqSVninDwiC67UwLQFAbLf5kn2
	5INeMbHGA2hBntC2DIgtmuyBEtLD7URcEdVKXXbek6itdXOQ/tco2zYI/zprapn4FeYEjQtIvJ9
	egwRj388JxSYhm8lkPTfDG2egQpazXoxXnN6KRjTQ+hAcM3uTD1/jtlsnW3/f8E9QVk/YOOwVH1
	FY/g9S7Gf2yRxvLrX89tyy2ljagxW49yiL6CfUipBkmCzuZNH8rlTKVvqyNE7GvE5lSAuSnyQCy
	PClRdwBxqYYAnXdSC2Z54iSw17suuv3lTHkl+8biB8eb7YWWpBRGCjVrQp3MTNCEdIUnViJMST1
	4lPTICeCCP20L/FROiINkbKySuWTqvOfwJvROErdeud8GrkM5RMqIQUqt+l/rA28Br7R3isKaG5
	tYhdUq2BssdJOyKoGRhNJBGm8d5k027AmiS6khrSkmoFwsDN9Z3kATQC9dPmSeY1UvRKX1EhHI+
	ka0MkkKzJ1935EJTw8Ij0cmVDFYs9Bb0dV8MQCGQ=
X-Received: by 2002:a05:693c:42d1:b0:386:b0ea:327d with SMTP id 5a478bee46e88-386b0ea3549mr3926679eec.5.1795474865278;
        Mon, 23 Nov 2026 15:01:05 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm41359262eec.22.2026.11.23.15.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:01:03 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 0/4] ASoC: arizona: switch to generic device properties
 and clean up
Date: Mon, 23 Nov 2026 15:00:53 -0800
Message-Id: <20261123-arizona-asoc-v2-0-6323d3c0961a@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKbFBGsC/3WNyw6CMBBFf4XM2hpaXsrK/zAspnWEMdKaFolK+
 u8WXLs8ybnnLhDIMwVoswU8zRzY2QRql4EZ0PYk+JIYVK5qKfNKoOePsygwOCMMHrXGBgutG0i
 Th6crv7bcuftxeOobmWltrMbAYXL+vf3NcvX+pGcpcqEqMk1RHMqyplM/It/3xo3QxRi/0LmrW
 roAAAA=
X-Change-ID: 20261105-arizona-asoc-ca9bba7a3bb7
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, Lee Jones <lee@kernel.org>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.17-dev-dd645

This series converts Arizona ASoC drivers to generic device properties
and cleans up dead code and formatting issues:

- Convert audio platform data parsing from OF-only APIs to generic
  device property helpers and drop CONFIG_OF guards across the codec
  drivers.
- Parse device properties unconditionally in the jack detection and codec
  drivers even when platform data is supplied, preserving existing
  channel settings and boolean flags when properties are absent.
- Drop unused hpdet_acc_id and hpdet_acc_id_line fields from struct
  arizona_pdata along with the unreachable HPDET accessory ID logic in
  the jack detection driver.
- Clean up coding style and argument alignment in arizona-jack.c.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Changes in v2:
- Only parse and validate wlf,hpdet-channel when the property is present,
  without clobbering existing platform data on absent or invalid values.
- Default an unset (0) hpdet_channel to ARIZONA_ACCDET_MODE_HPL in
  arizona_jack_codec_dev_probe() instead of using the GNU ?: extension
  in arizona_extcon_device_get_pdata().
- Link to v1: https://patch.msgid.link/20261105-arizona-asoc-v1-0-25ec7338446e@gmail.com

---
Dmitry Torokhov (4):
      ASoC: arizona: convert audio pdata parsing to generic device properties
      ASoC: arizona: always parse device properties regardless of platform data
      ASoC: arizona: drop unused HPDET accessory ID support
      ASoC: arizona: clean up coding style and formatting

 include/linux/mfd/arizona/pdata.h |  21 ++--
 sound/soc/codecs/arizona-jack.c   | 248 ++++++--------------------------------
 sound/soc/codecs/arizona.c        | 121 +++++++++----------
 sound/soc/codecs/arizona.h        |   8 +-
 sound/soc/codecs/cs47l24.c        |   8 +-
 sound/soc/codecs/wm5102.c         |   8 +-
 sound/soc/codecs/wm5110.c         |   8 +-
 sound/soc/codecs/wm8997.c         |   8 +-
 sound/soc/codecs/wm8998.c         |   8 +-
 9 files changed, 113 insertions(+), 325 deletions(-)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261105-arizona-asoc-ca9bba7a3bb7

Thanks.

-- 
Dmitry

