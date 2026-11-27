Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799587;
	b=czStCgHFWPfV2tlsswQtmSRr+uqrHbTc6ebN55Jk+20UnGISoWS5e7/hDVG/SIrZ2ac9
	 59JzVJDGellMYTjvI+YoomohJWEwcbFi6bag+QwLdZMgKn7SIHOav1esn86UQX5X7JAcy
	 //3sqB7ZyfLUZ4Gz36qoKmR/boOcWlrhQ15dV7+IWplLRpb5xR95jbiExidVkRfZEAGon
	 6SY4v49u+SrW+SkWnws47C2IMx62uTz74/xQ6hF8an/341t2VQLwoFIkFiHqT0N/cE/8A
	 WtN7+amiFIXgB4ekBXz1f0fMh+Vd808aTva3zSu32LFyjL9QLyD7ql+42Jyzl1mz2jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7S4J0Oj3sYJi1UqXP5r2+N/vXgyTszyUgul/cChtfHk=;
	b=IK+hGhPVQIYX/bO6KWNediqEc9aIFz//4BKjNbHd1nmQ6bTxIJxHPk24TreWjc+D8kXc
	 gNQE1evm6VEjrQCGg44uGOwUJx6Vg051qzLqoiC5rIb2G9zrvh4pfQ6/J/5JhFKBZb7Lr
	 WHmZnmbjj5j8zBdFjMSDORvUdJPZDlZmrK+KoL6jqV6GgUNeOk6D9hZo/Z2EUCy6IYieU
	 M0ExDBImFrHVQQHf3QIK3iRdD/aeA52g8y+UZ7uEeOsMwr2xa4lqqsd26ZTRYd8TK34Pn
	 GOPNulHHjh31IuDpNT/ImwlFAaDU+mbU5GT9EJ7d1IGsmj7kYawrULOtgZ4YSWUiuxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fj7vH0m4;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EAD606A31E
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 17:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7EAD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fj7vH0m4
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cded697ba49so169626a12.1
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 09:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795799585; x=1796404385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7S4J0Oj3sYJi1UqXP5r2+N/vXgyTszyUgul/cChtfHk=;
        b=fj7vH0m4TeZVxSK8k5+Sz0uxrzg3f6k4UyMgACqdlY8cjUZo/6Vw64dAY+cCj8p6hp
         qJZMFHzUaWj11QpZHmyemfspjyUsV7SdGByfZPfNZ9pBVG0bEaCUp7j2xw0/KPrFXFTg
         JW9CWgxe4r+7O3oJbMpJT6sUt6Q/Hwzyur5mTQog7A6MM6zTF5Mhx6a9Etxm1eSZPzxY
         t/hi9LFoM9gFcRHYScoOsEZUlw5OWsUnc+WRVeQwBQHwB6lxQPmKtNgZ6mRoh/CqVkXi
         mWywp6E5Cd45e1sw3kU65/IWYgRbTYfUr5iSk9LULtwBEyvJHKhpWBtxpF64Af1+JfTs
         W0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795799585; x=1796404385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7S4J0Oj3sYJi1UqXP5r2+N/vXgyTszyUgul/cChtfHk=;
        b=vF+JSuaGHIM0CLVSQnwIIVfBZdHEZJzzMkAXiR4HlASKj/MbXZHEyrQHgC/oOW7ujp
         +DzCr0wrvwewBRkh2uPRYLG5xl9le2CQMeWVZoqM1uM9/ZhvVrgriAbIAStucWoWJIne
         59fe6cjUjcJspUs9LMkLU7C8AS4IiZnxuuZ1bE3DHA2SIpElzy3CPXn8FUUyBTNkOSSv
         T0HgDYl6DoQuF/UMHv10XQjwS051tQKDjKOlYIwaoOx1ZegBjaOQ8doe/8OLpXfvqziJ
         0bklSx2sxY24SyNkPBkiqWje6OlLbBebphwcgygxPDN3cA5sIPcXnMqjBGZSN39aL8yQ
         tJCA==
X-Forwarded-Encrypted: i=1; AL+hErFoaLzFUS10QZioiAhx1CM37moO1CyotqeYvDs7JRV1xEzA1zx1tmCILQHjMpQ2R3hqQcEAGsxBOV8/Vw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8vL6XdHSdZyy3pj7GXcLhhDRN+zun+ZfUfaJ87KR/R06x9npYT
	jfairPmNOYmoJKi/lRflZBpgJYhjF2I+Ed9Tl4huPSK+j0q25/Yy7hoH
X-Gm-Gg: AZFdTZcrY4JIC3+6/628F33mhpNcuB+QbsCFQZpGCrifv1RqNDz6XR8FXq9eRVxc3CS
	lssb2/Tzn3k9/J0kUAe9Vz/SP4x0U0rZG6Mb+LMsx5StJEnoi5omojgPhs0K86Xg7SvqjJUVhx0
	qt+F4u1nNSPLa8U234ipCBbxuNvl3btE2zJrvKtZCxh88ZZSMwnJjjt/CN1Gm1zbygTXHY02eJc
	NeddBOfb9ys3rjznEfB5+3IXHHNzYEc4SziAyX713yKA5m8uSkkqUDUmZjw7nddW30eNejLMjdj
	6Xc+AuOoKDsv2JK7XVR+U51Lodjzwx2DwnoETXvrq8efM3Z5jrxh6TgXg7gC4TvuobYHk3YP4NE
	NKCG31M+fzNJL/BdNSxBMRN9QgkirR8ToX/RqYuFCNKozCneqtbgYXRadDs682uYK86SkQluHIQ
	yxDF181SOBTHgQiL0KUGUayrKhuEiT+a7rl71dbfNuW+pP5RCtJyUCsY1UbfktZFa7aqoZ0AhS7
	Y+VHjWW+SOqITBRcDXyv3v+RakW8KHnF4BTlRHNo1LbRPIBJLiUGb8z7wfvdoOQ0p/xCtXdoIc7
	0/cb/xBNE2UAf6zpVhdhtM4CSwPZ4G3E0A0vLKxNsqdOPPRtqfeM4N7BRWTvRuQWZxGsjgbJlFM
	+95kyaTBds0ddgRAxyTCE50nlaYlG5mKou4ubuXZDSqzydRZtMACSvK7DcLH2q2ilIdCO3SBG2D
	CM5iIPmFTwQpI81C9qntBv
X-Received: by 2002:a17:90b:2e49:b0:3ac:80dc:f419 with SMTP id 98e67ed59e1d1-3b41c90811fmr24324820a91.25.1795799584854;
        Fri, 27 Nov 2026 09:13:04 -0800 (PST)
Received: from fangorn.. (97-120-153-124.ptld.qwest.net. [97.120.153.124])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm38643445a91.3.2026.11.27.09.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:13:04 -0800 (PST)
From: Carl Egbert <egbertcarl@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Eric Naim <dnaim@cachyos.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Carl Egbert <egbertcarl@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Fix mute LED regression on ThinkPad T440/T450 family
Date: Fri, 27 Nov 2026 09:12:41 -0800
Message-ID: <20261127171241.1619113-1-egbertcarl@gmail.com>
X-Mailer: git-send-email 2.48.1
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

Since commit 8a889cce1c6d ("ALSA: hda/realtek: Unchain
ALC269_FIXUP_THINKPAD_ACPI from ALC269_FIXUP_LIMIT_INT_MIC_BOOST"),
ThinkPads whose fixup chain goes through ALC292_FIXUP_TPT440_DOCK or
ALC283_FIXUP_INT_MIC no longer get their mute LEDs set up. On a ThinkPad
T450 (SSID 17aa:5034), the speaker mute LED no longer follows the mute
state: no mixer control gets the speaker LED access flag, so snd-ctl-led
is not loaded automatically and
/sys/class/sound/ctl-led/speaker/card1/list stays empty.

Commit b2d447288fa7 ("ALSA: hda/realtek: Add
ALC269_FIXUP_THINKPAD_LIMIT_INT_MIC_BOOST quirk") added a ThinkPad
variant of ALC269_FIXUP_LIMIT_INT_MIC_BOOST and switched the quirk table
entries that selected the plain fixup directly. Then
commit 8a889cce1c6d ("ALSA: hda/realtek: Unchain
ALC269_FIXUP_THINKPAD_ACPI from ALC269_FIXUP_LIMIT_INT_MIC_BOOST")
removed the chain to ALC269_FIXUP_THINKPAD_ACPI from the plain fixup.
However, two fixups reach the plain fixup through their own chain_id and
were not converted:

  - ALC292_FIXUP_TPT440_DOCK, used by the ThinkPad T440, T440p, T440s
    (via ALC292_FIXUP_TPT440), T540p, W541, X240, X1 Carbon 2nd, T550,
    X250, L440, T450, T450s, L450 and X260
  - ALC283_FIXUP_INT_MIC, used by a ThinkPad (17aa:501a), the IdeaPad
    S210 and the Lenovo 145 (via ALC236_FIXUP_LENOVO_INV_DMIC)

Their chains now end before alc_fixup_thinkpad_acpi(), so these machines
no longer get the mute LED setup for thinkpad_acpi, nor no_shutup_pins.

Point both fixups at ALC269_FIXUP_THINKPAD_LIMIT_INT_MIC_BOOST, which
restores the fixup chains these machines had before 8a889cce1c6d. On
the IdeaPad S210 and Lenovo 145, is_thinkpad() is false, so they only
get no_shutup_pins back, as before the regression.

Tested on a ThinkPad T450 on top of sound.git for-linus (e79163b531ec):
with this patch, snd-ctl-led is loaded automatically at boot, and the
speaker and mic mute LEDs follow the playback and capture mute state
again. Not tested on the machines using ALC283_FIXUP_INT_MIC.

The regression was bisected on the affected T450. An AI assistant
(Claude Code, using Claude Opus 5.5) was used throughout: it helped
diagnose the problem, plan the bisection and write the scripts used for
it, identify the cause, and drafted this patch and changelog. I ran the
bisection and the tests on the hardware and reviewed the change.

Fixes: 8a889cce1c6d ("ALSA: hda/realtek: Unchain ALC269_FIXUP_THINKPAD_ACPI from ALC269_FIXUP_LIMIT_INT_MIC_BOOST")
Cc: stable@vger.kernel.org
Signed-off-by: Carl Egbert <egbertcarl@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 5c3b383bb618..003f5052a842 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -5246,7 +5246,7 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ }
 		},
 		.chained = true,
-		.chain_id = ALC269_FIXUP_LIMIT_INT_MIC_BOOST
+		.chain_id = ALC269_FIXUP_THINKPAD_LIMIT_INT_MIC_BOOST
 	},
 	[ALC290_FIXUP_SUBWOOFER_HSJACK] = {
 		.type = HDA_FIXUP_PINS,
@@ -5361,7 +5361,7 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_tpt440_dock,
 		.chained = true,
-		.chain_id = ALC269_FIXUP_LIMIT_INT_MIC_BOOST
+		.chain_id = ALC269_FIXUP_THINKPAD_LIMIT_INT_MIC_BOOST
 	},
 	[ALC292_FIXUP_TPT440] = {
 		.type = HDA_FIXUP_FUNC,

base-commit: e79163b531eca7f3fdc05031f4b43b6f7c51d3bc
-- 
2.48.1

