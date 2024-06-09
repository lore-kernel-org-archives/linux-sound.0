Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A124D22309
	for <linux-sound@vger.kernel.org>; Sun,  9 Jun 2024 13:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717940584; cv=none; b=m5eLsMZCoZI0pDhV/2YeSvzs2kVLhtiOHmEDYEM/H86KuQfYrTJuY8f4Y7agq7L1G61hWc/galjoitmAk6s+s1k/281S9jzKuHku9eMwjOuHhN1Xi5GY+wIXvZbvlsF0+BOcX0/lGqBLjAVR5cAXQfq5llzl4za5g3WPpopWozQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717940584; c=relaxed/simple;
	bh=MARpk0zVXQvvyd1XESGYlCM7rkF488Rqdqukr5Pu3Ls=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ckJI2Xm5nVSIy5vTIoxRuo860rrFvBb6LEtR3r1JqEOrxppHO2zgEIE4s9ds1smwn1WewQTQ95pTNuD2i5tKwGJ04HiFWZRMgHSH+alF0ZWFDz8Sc3ixe2unFSkOSaK29wusu5s806e7xjBIEyk8Ixuh18sGIY51SM/OEzByjUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=bMcaYnWB; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="bMcaYnWB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1717940581; x=1718199781;
	bh=MARpk0zVXQvvyd1XESGYlCM7rkF488Rqdqukr5Pu3Ls=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=bMcaYnWBULecjFxq49+ObpHefupCuEbkM+i0SxmGgBB+etCnxvFVLb5mKWbm36CIN
	 2upQ1MocASt2AesuadQ8HcHf15+GuuPYqQb7vgKkstjxiSvhuT942NwoxNH4RS476c
	 lJPIH1hMUtfiakhlwlAZgkBqSYjmJl5uvdXS27B+hnwufsSYI2yc8dqb4pkaj6gxDz
	 fahVVAdgLkiJ1nd6AkclwGDSjcPES23Vk9DxreSMoa84omfMbN3Bh5lh6nx5qwrZvA
	 irkcGrVlJG+sJaJ0Jdxro7uxpb4+HXxCcpODOrbHC1B8MN2xxFSCZ7OJHptJ8BOmKF
	 OsYoJUc+EgPIg==
Date: Sun, 09 Jun 2024 13:42:57 +0000
To: linux-sound@vger.kernel.org
From: Nick <nicktelindert@protonmail.com>
Cc: Nick <nicktelindert@protonmail.com>
Subject: [PATCH] Revert 5aec989 because it prevents ALC236 headphones from working and causes freezing on reboot
Message-ID: <20240609134247.5460-1-nicktelindert@protonmail.com>
Feedback-ID: 36648358:user:proton
X-Pm-Message-ID: cd0ed25aba294611498a8d4d8f6f471cc32cf0c8
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

---
 sound/pci/hda/patch_realtek.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index e3c0b9d5552d..993c1e8b68d9 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -581,8 +581,6 @@ static void alc_shutup_pins(struct hda_codec *codec)
 =09struct alc_spec *spec =3D codec->spec;
=20
 =09switch (codec->core.vendor_id) {
-=09case 0x10ec0236:
-=09case 0x10ec0256:
 =09case 0x19e58326:
 =09case 0x10ec0283:
 =09case 0x10ec0286:
@@ -3650,6 +3648,8 @@ static void alc256_shutup(struct hda_codec *codec)
 =09/* If disable 3k pulldown control for alc257, the Mic detection will no=
t work correctly
 =09 * when booting with headset plugged. So skip setting it for the codec =
alc257
 =09 */
+=09if (codec->core.vendor_id !=3D 0x10ec0257)
+=09=09alc_update_coef_idx(codec, 0x46, 0, 3 << 12);
 =09if (spec->en_3kpull_low)
 =09=09alc_update_coef_idx(codec, 0x46, 0, 3 << 12);
=20
--=20
2.45.1


