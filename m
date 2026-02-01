Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7231B2DC35A
	for <linux-sound@vger.kernel.org>; Sun,  1 Feb 2026 23:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769987548; cv=none; b=MJCk/AmI7OO/NBx8trde6TnztHlw8Je/xw3IdFiSm98WsmibTgN8lAYqYd4Z7ANMBtESfzJL6rSTlEMeaA6e6O3futmWFp0+ExAt/uvatTKUc9/IBK5Ig8SbJALpnj2AvbBWeWQoCkpEInPly6u4eMdp0W/oaUsj1nbNmsMweow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769987548; c=relaxed/simple;
	bh=J/PZ6n4AFGAeQlIz7TJ3GSyErMvg+Bim/uzLiGxdV8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=owDDq9gf+KnFurZUuja432om3b6sz02zd4AXMHw4tAcitnmzdg7NafqAKG20UlVwIMrMDd6DNmMwqKc2+6U6KwcKWx5QU1eOAd33iMMipZrJBhXJ30j8C9QfMWKbbctiOfQk76IyNmo07qUSv53qhU/+0FyU1kHpzzDLlIGseaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dionne-riel.com; spf=pass smtp.mailfrom=dionne-riel.com; dkim=pass (2048-bit key) header.d=dionne-riel-com.20230601.gappssmtp.com header.i=@dionne-riel-com.20230601.gappssmtp.com header.b=qfl+jDBl; arc=none smtp.client-ip=209.85.219.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dionne-riel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dionne-riel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dionne-riel-com.20230601.gappssmtp.com header.i=@dionne-riel-com.20230601.gappssmtp.com header.b="qfl+jDBl"
Received: by mail-qv1-f65.google.com with SMTP id 6a1803df08f44-88fca7bce90so50411656d6.3
        for <linux-sound@vger.kernel.org>; Sun, 01 Feb 2026 15:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dionne-riel-com.20230601.gappssmtp.com; s=20230601; t=1769987546; x=1770592346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBLCB+78gX0424Xcl43Bs5LgpFepPsrAgehMW3JCkOM=;
        b=qfl+jDBly9fo6LmNbjuY3EETpp2NejMa0YgEhjv8foKlRvC8fk+6LpnWmwiJaIrSuA
         sqZqyuL2BxVVP5YiwguWwr2m/Oc0hE/C1XRpS1zE0GjbRoAr5hRx98klAZ5EkX38J7WF
         wQh/fVd5gOojdh9MyFEHuyzB9F9xbgaNoRUqNiUwT0bhvuBgKoIu75zdwEp89t7CyZ6z
         QZqknM0QIwNHDE3ZMJzVEwL4L5dJQQcZvCntwc9vTCgwq52q9fK7qqWIF9OfbrM6Pm9V
         dh2VIHKhC5Rmj5LH9p6AyYe2DVGxxTslAlz+gUk9vhHLIA91Ua5dgd7qu6PvvOZDq/2k
         3vWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769987546; x=1770592346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KBLCB+78gX0424Xcl43Bs5LgpFepPsrAgehMW3JCkOM=;
        b=mY/9VCPkMoCaew09NLZ1AEbzhpRf5y7dz7lZxNFvAM7bCbv57RUBin2Pi4kh8WuDAY
         vrn0u+kkkijNZFQzKSN7Cehl6OKY81OyfrOjHAx8ceKJKWcsdXaC+yHb91e5dHrnfJP8
         K3Go23Th/PQGzLZYu6oP7aHv3ChWduSABMMchNgjUp1zL2pYkyjUkZXdZ7WHHr30BN8w
         EyLyyWuem60Spna7zLmgj3JZeOGKDDjATmzMlq8FOzzHrRv8Qk3P162lK/yIME3o+NB7
         c86gdJEwervYr+tzVpa0XFeTnZ+g2s0rgKAKL7j2K61mXXJ9Aeho5OxHo+q+oKG8lskO
         8mIA==
X-Forwarded-Encrypted: i=1; AJvYcCXszUOglmUMHvmM44gxURU4cbenpS8huctpKO/2dtH+GQxoQR0PTmI4BUO+ueZw20khvT2wWSZcLZKUxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzddY48dyu1LuOSUtwv6/WSwXsWB/DMgh3EeE/bAC3tqpamRggf
	fy3tlo8VhWHZ9F5DPZlhTpaLmgJzzsG0h5wCFDkGUi4Ev1u5GLk0jXvhoUQBLAEjHg==
X-Gm-Gg: AZuq6aJGv+/3KTepu+8eWT5lNICOkzf74Mt/1wessV934/ueQrP5Lev2bggoGTNsFgP
	xl9zn1flLVvOaXTQEypoAIzvcVtB8e456r973rz60XCoLuCM4E8Spg9+7SOgvsr7/H8WCHkNvqQ
	1SiiRRX8/bXsQdH+E7yqhHUhYhOeIybHABD3vRmTLGdJDqNiDv/WRM02Mad5EysfIz8hJD8OI1/
	mEl18S/Kll7vIF54Pv0ModK+NYPQa75zQIAOPBoGvUPNAIfxvmz/z69JjMgxVbMj8B237hbF5tl
	w4vXu16aOuBQ9bezubCKrNxbFpW1vyNEO6MXW8KHM5uJL2rh1J8tb7qt8WdxfXAlyTiN+Tlu4SO
	S9mtRJXOHc3cVDtPpdZ4tPvK3DYmWqatYCeaKIcPgB8TRzgd56KleB6Cw/xstUIPgbhBRCx7lD5
	AvIqOUt+5UDtoxWDqa7N72b3c2A9S3H8f9sbs/mH6U7qnUZeQILVIS8YPXmLSIkq/DR+ZptCEFL
	T3U
X-Received: by 2002:a05:6214:519c:b0:888:4938:49e5 with SMTP id 6a1803df08f44-894ea0dba46mr131021566d6.69.1769987546461;
        Sun, 01 Feb 2026 15:12:26 -0800 (PST)
Received: from frankgrimes.elk-nominal.ts.net (135-23-195-66.cpe.pppoe.ca. [135.23.195.66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d3740d73sm102537246d6.27.2026.02.01.15.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 15:12:25 -0800 (PST)
From: Samuel Dionne-Riel <samuel@dionne-riel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Samuel Dionne-Riel <samuel@dionne-riel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ALSA: hda/realtek: Add generic quirk for Bass speaker DAC avoidance
Date: Sun,  1 Feb 2026 18:12:14 -0500
Message-ID: <20260201231216.1655154-2-samuel@dionne-riel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260201231216.1655154-1-samuel@dionne-riel.com>
References: <20260201231216.1655154-1-samuel@dionne-riel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change is for the follow-up commit, where the match on the specific
device (Minisforum V3 SE) is added.

This pattern (re-routing the bass speakers off of a DAC without volume
control) seems common enough that having a "model" to match against and
quickly use to verify may be worthwhile.

The alc285_fixup_thinkpad_x1_gen7 routing was selected, amongst the
different options, as it should allow tuning the ratio between both
speaker set.

The routing was verified using `hda-verb`, and picking either 0x00 or
0x01. Either routin made the volume of the bass speakers controllable.

    hda-verb /dev/snd/hwC1D0 0x17 SET_CONNECT_SEL 0x01

Signed-off-by: Samuel Dionne-Riel <samuel@dionne-riel.com>

---

It may be worthwhile to clean-up behind and make the other fixups
re-routing `0x17` from `0x06` to either `0x02` or `0x03` also use the
same routing. It's a bit confusing, determining which routing to choose
when adding one for a device.

 - alc289_fixup_asus_ga401
 - alc295_fixup_disable_dac3

Might need to be checked (and re-used within a chain):

 - alc287_fixup_yoga9_14iap7_bass_spk_pin
 - alc245_fixup_hp_spectre_x360_eu0xxx
 - alc245_fixup_hp_spectre_x360_16_aa0xxx

I might be missing some, if for example they are handled through pin
fixups, or other fixup mechanisms.

I don't have the experience needed to know for sure if the cleanup would
be appropriate. So please excuse the lack of follow-up on that.

Signed-off-by: Samuel Dionne-Riel <samuel@dionne-riel.com>
---
 sound/hda/codecs/realtek/alc269.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index cafa48b5aceb5..5d38e371a6836 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3805,6 +3805,7 @@ enum {
 	ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED,
 	ALC288_FIXUP_SURFACE_SWAP_DACS,
 	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO,
+	ALC245_FIXUP_BASS_HP_DAC,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -6295,6 +6296,11 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc288_fixup_surface_swap_dacs,
 	},
+	[ALC245_FIXUP_BASS_HP_DAC] = {
+		.type = HDA_FIXUP_FUNC,
+		/* Borrow the DAC routing selected for those Thinkpads */
+		.v.func = alc285_fixup_thinkpad_x1_gen7,
+	},
 };
 
 static const struct hda_quirk alc269_fixup_tbl[] = {
@@ -7558,6 +7564,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC285_FIXUP_HP_GPIO_AMP_INIT, .name = "alc285-hp-amp-init"},
 	{.id = ALC236_FIXUP_LENOVO_INV_DMIC, .name = "alc236-fixup-lenovo-inv-mic"},
 	{.id = ALC2XX_FIXUP_HEADSET_MIC, .name = "alc2xx-fixup-headset-mic"},
+	{.id = ALC245_FIXUP_BASS_HP_DAC, .name = "alc245-fixup-bass-hp-dac"},
 	{}
 };
 #define ALC225_STANDARD_PINS \
-- 
2.51.0

