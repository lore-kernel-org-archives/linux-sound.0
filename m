Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361F636D9FE
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 18:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790967055; cv=none; b=nfBbRGBt86z2+NUHJYqV0HzPVSASlFD1HZMbZBtVJhl1hoob6g4WkVKUwHFFKeITP6d8YugXfyg6AqLQxMozpU4kDXfJQ4PkwJ+dN5AWYrZyoARRbvd5aeP0/SKYuPokPKeRR95LVtV420QQ6Vvu7GZzXPoc70x6m9AxYESFpCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790967055; c=relaxed/simple;
	bh=d0Cwr9r5bEYFoTe1/+9UpoNZNZxU0BAzUwaupHJmFKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YuyXnXpdM4lyVISpKG6zCWk8Mg9GL2+u+mGoIkJu9uHLYNlfvvsoG59bdMzbI/LdlXGBKwldG3mCBSbiHJ9whNx+R1+hRFRutZuZafTKLK+g+hXOkgpsckhtp1bmQZLYjlkoELrnAwBZIyu1SVe+UsX6rFiYhmT80g6sn0rTt7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meowing.net; spf=pass smtp.mailfrom=meowing.net; dkim=pass (2048-bit key) header.d=meowing.net header.i=@meowing.net header.b=bAb9lFoQ; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=HnfF8kx7; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meowing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meowing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meowing.net header.i=@meowing.net header.b="bAb9lFoQ";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="HnfF8kx7"
DKIM-Signature: a=rsa-sha256; b=bAb9lFoQos+i2FV6lRUQcJXYqTGJ1Dz3PgIjQZiQ2YLV+wAx9l5Qebwd35mVZZUTZGDWU8OIv7cE5i9378v4dS6zwtR9nMCPtDcu2Kb9q3HwEncSYIYVWro2yFmGL0nWYIF49bpYPNlsGdENIPQ1Ca/fQTot+JY9/DN0FV3eulNcL5CasaFa5oXV9qbPQK7eR/qgUYVZGSDdWT5vVtaQaqlJgDZkvDrUucP5OeC9AFpjeK9cfUmtcEs1s0NQFMwFISr32qEgxt+0EZ7D/aFOkywHb/HZDl7IEnFRgmjBF6OH1xsxljJI1D6DKhcia2YQ3czLnLbRg7B0B8j2dXqejQ==; s=purelymail1; d=meowing.net; v=1; bh=d0Cwr9r5bEYFoTe1/+9UpoNZNZxU0BAzUwaupHJmFKs=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=HnfF8kx7ZvxIgGejb3QPEVksBbUfhN5jhxgf1G7AekCy9cl/t1FWkhskQfBFLimR9xM6lrDuaSFlbRxeOKZq9GXBPsc52/+zE0hrsYWSNGAQoRZMWVx2sgHqLfZvHYnvCy962N6OppOiXauctcfXaUJdmnUp/fSEAYh6OwQF+qk7jPdV471XzM/DIOIPcpSWeDDp8x1OS+V0+Rca//znm7hSE6YTV+CnpIes6Yp7J+DmynT3l2m5397xO9R5bfJDyHZPBk+K5H/3+AFBPbQur7gfFXV97Hae2cVY1J5MgsPPM1JSunF8R9woaIT/UiQwXNafi901DdKu/rbHpqxE7w==; s=purelymail1; d=purelymail.com; v=1; bh=d0Cwr9r5bEYFoTe1/+9UpoNZNZxU0BAzUwaupHJmFKs=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 378383:29868:null:purelymail
X-Pm-Original-To: linux-sound@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 865561449;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 02 Oct 2026 18:50:42 +0000 (UTC)
From: Yejung Kim <catcake43@meowing.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yejung Kim <catcake43@meowing.net>
Subject: [PATCH] ALSA: usb-audio: Add quirk flag for Creative Stage SE
Date: Fri,  2 Oct 2026 14:50:35 -0400
Message-ID: <20261002185035.9040-1-catcake43@meowing.net>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

The UAC mixer on Creative Stage SE (041e:3289) returns invalid/constant
GET_CUR volume values, causing ALSA to treat it as a sticky mixer and
to disable it.

Add a quirk table entry applying QUIRK_FLAG_MIXER_GET_CUR_BROKEN to
allow volume controls to function correctly.

Signed-off-by: Yejung Kim <catcake43@meowing.net>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index c5870901a8d4..961038f08890 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2242,6 +2242,8 @@ static const struct usb_audio_quirk_flags_table quirk=
_flags_table[] =3D {
 =09=09   QUIRK_FLAG_IGNORE_CTL_ERROR),
 =09DEVICE_FLG(0x041e, 0x324d, /* Creative Sound Blaster Play! 3 */
 =09=09   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
+=09DEVICE_FLG(0x041e, 0x3289, /* Creative Stage SE */
+=09=09   QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
 =09DEVICE_FLG(0x041e, 0x4080, /* Creative Live Cam VF0610 */
 =09=09   QUIRK_FLAG_GET_SAMPLE_RATE),
 =09DEVICE_FLG(0x045e, 0x083c, /* MS USB Link headset */
--=20
2.56.0

