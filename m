Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6124D2DCC1F
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 22:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774650328; cv=none; b=PhD73a6e+cOiuOakcv8rghIHZJM3H1WW5EB0k8owLG2VfoW/vF2rMDEAm555ScEEAhZRJk4biS/As8cl16yNUZZYiSLaaKhnYwQOzKBgrY8C9GAC7I1b5Mw1dUYpxq7AyBK3VL4kZmKElPxeDS02pDAFrWRx3M4S5kkeJXl8P38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774650328; c=relaxed/simple;
	bh=6zmBcEg5uIU1kwE2nQ3kMpMbnY6JSJXDelamQDPFHx8=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc; b=TgrRf/WS/5eTy2Hnwl6dlFu4g32lLw1Vq9NZ1qXkqt6iO9vIQLRFUXfPvNmawpQ1wvYvJUT5WstTSI51ptniTBZ40POxbxaY1m/CLHjbu9cpD06EXzAZ/UWGGsVA/h8r3SyRFwG4A/aqFjkxDlQ1Xp4vFOKUHdLL4iSRsVclsWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lausen.nl; spf=pass smtp.mailfrom=lausen.nl; dkim=fail (0-bit key) header.d=lausen.nl header.i=@lausen.nl header.b=mWyd7rqZ reason="key not found in DNS"; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lausen.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lausen.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=lausen.nl header.i=@lausen.nl header.b="mWyd7rqZ"
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id 24187180B0E
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 23:25:17 +0100 (CET)
Received: (qmail 15931 invoked by uid 990); 27 Mar 2026 22:25:17 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by devico.uberspace.de (Haraka/3.1.1) with ESMTPSA; Fri, 27 Mar 2026 23:25:16 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 27 Mar 2026 22:25:15 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Leonard Lausen" <leonard@lausen.nl>
Message-ID: <db84dcf91bc8dbd217b35572b177d967655ff903@lausen.nl>
TLS-Required: No
Subject: [PATCH] ALSA: hda: cs35l41: Fix boost type for HP Dragonfly 13.5   
 inch G4
To: sbinding@opensource.cirrus.com, david.rhodes@cirrus.com,
 rf@opensource.cirrus.com, perex@perex.cz, tiwai@suse.com
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, me@nicho1as.wang
X-Rspamd-Bar: /
X-Rspamd-Report: BAYES_HAM(-0.282287) MIME_GOOD(-0.1)
X-Rspamd-Score: -0.382287
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from:to:cc:subject:date;
	bh=6zmBcEg5uIU1kwE2nQ3kMpMbnY6JSJXDelamQDPFHx8=;
	b=mWyd7rqZ9r6T9a5vnaHqB29ZB2c4oD+dVI0n9Xp4+JiIZ0S4TIO6LTaB6Wqt4eNtgo/9aP7tqf
	p4l3xXHfe+S449uXV4mk/x44kCRAjhBsQVjXfy+JEzksmGx2opjE3vvghyOpDW4c8dkkxwlP5FL2
	lwzgnsKnyKr+AFiozPgsxcu0P3uOOdIxhHoI5wXDn6AkgF646u40bi6r+reEwq2Rt4ZRdjJJWIsQ
	O+iQSFhFJ1BpgjgJMMhrwRZU3CCIWi6jFBfJDgzg8i64zQmMUj3P4MWNSpHnAZf00phRlgr50MCC
	xuzFjFXQKyI1oL+l5F+NrYtyiKrfWp3kC3lDCqhvD+RLw+x8cUekMDNbXKf0Q+BugpyLlUw+j1aU
	s15KsEINw4WBmdcsb8TSbqtfu0gauqJXIhFSxo/2HCsqiSKLRvbEiB97yzo1HRqWmy1/bLI9xnja
	H7/foqtXoycUguhRNsMiLuQemgLGDIdOuNOLRSU1zj1wuKntdFxN68/Se7HaKTKr+hPoCGqsB5NJ
	2i4eskO5J7Cov+dw21kw/FPbOc3ubf2lgjHiOhEYzaejufEv62jWT55RPAOxdgdeSdBOpVnrnV9G
	kSF7YFAcI3E7cl3c9rhX6HOsOMwDrljzzh7WOX+Tmvr1Is7glB5qMPOSpXNx3DIM2zDt2I3d3Nod
	0=

The HP Dragonfly 13.5 inch G4 (SSID 103C8B63) has _DSD properties in
ACPI firmware with valid reset-gpios and cs-gpios for the four CS35L41
amplifiers on SPI.

However, the _DSD specifies cirrus,boost-type as Internal (0), while
the hardware requires External Boost. With Internal Boost configured,
the amplifiers trigger "Amp short error" when audio is played at
moderate-to-high volume, eventually shutting down entirely.

Add a configuration table entry to override the boost type to
External, similar to the existing workaround for 103C89C6. All GPIO
indices are set to -1 since the _DSD provides valid reset-gpios and
cs-gpios.

Confirmed on BIOS V90 01.11.00 (January 2026), the latest available.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D219520
Originally-by: Nicholas Wang <me@nicho1as.wang>
Signed-off-by: Leonard Lausen <leonard@lausen.nl>
---
This is a reworked version of Nicholas Wang's patch from Nov 2024 [1].
Stefan Binding noted that this laptop should have valid _DSD.

Analysis of the ACPI DSDT confirms the _DSD exists with valid
reset-gpios, cs-gpios, and cirrus,speaker-position. However,
cirrus,boost-type is set to 0 (Internal) while the hardware requires
External Boost. The cs35l41_hda_parse_acpi() fallback also gets this
wrong since it infers Internal from the non-zero boost parameters.

With Internal Boost, all four amps hit "Amp short error" at
moderate volume. Overriding to External Boost (like 103C89C6)
resolves the issue. GPIO indices are set to -1 since the _DSD
provides valid reset-gpios and cs-gpios, addressing Stefan's
concern about cs_gpio_index.

Tested on BIOS V90 01.11.00 (Jan 2026, latest available from HP).

[1] https://lore.kernel.org/linux-sound/20241122044435.28061-1-me@nicho1a=
s.wang/

 sound/hda/codecs/side-codecs/cs35l41_hda_property.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c b/sound/=
hda/codecs/side-codecs/cs35l41_hda_property.c
index 16d5ea77192f..732ae534db36 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
@@ -55,6 +55,11 @@ static const struct cs35l41_config cs35l41_config_tabl=
e[] =3D {
 	{ "103C8A30", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1,=
 -1, 1000, 4100, 24 },
 	{ "103C8A31", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1,=
 -1, 1000, 4100, 24 },
 	{ "103C8A6E", 4, EXTERNAL, { CS35L41_LEFT, CS35L41_LEFT, CS35L41_RIGHT,=
 CS35L41_RIGHT }, 0, -1, -1, 0, 0, 0 },
+/*
+ * Device 103C8B63 has _DSD with valid reset-gpios and cs-gpios, however=
 the
+ * boost type is incorrectly set to Internal. Override to External Boost=
.
+ */
+	{ "103C8B63", 4, EXTERNAL, { CS35L41_RIGHT, CS35L41_LEFT, CS35L41_RIGHT=
, CS35L41_LEFT }, -1, -1, -1, 0, 0, 0 },
 	{ "103C8BB3", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1,=
 -1, 1000, 4100, 24 },
 	{ "103C8BB4", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1,=
 -1, 1000, 4100, 24 },
 	{ "103C8BDD", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1,=
 -1, 1000, 4100, 24 },
@@ -475,6 +480,7 @@ static const struct cs35l41_prop_model cs35l41_prop_m=
odel_table[] =3D {
 	{ "CSC3551", "103C8A30", generic_dsd_config },
 	{ "CSC3551", "103C8A31", generic_dsd_config },
 	{ "CSC3551", "103C8A6E", generic_dsd_config },
+	{ "CSC3551", "103C8B63", generic_dsd_config },
 	{ "CSC3551", "103C8BB3", generic_dsd_config },
 	{ "CSC3551", "103C8BB4", generic_dsd_config },
 	{ "CSC3551", "103C8BDD", generic_dsd_config },
--=20
2.43.0
