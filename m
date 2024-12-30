Received: from mail-10625.protonmail.ch (mail-10625.protonmail.ch [79.135.106.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD87142905
	for <linux-sound@vger.kernel.org>; Mon, 30 Dec 2024 15:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735572790; cv=none; b=MSJLdkybyQmcc06X/f4+XPbsf3WunLFvs3Snk+0T2YoX0Up7Qhuajiazx90EijRtc+dRnoXOPhmhv0dNrNT1DhbE62yK33gQW/l4wnB8aDbVJ4LaYTSMgwG7rMU3Icq3+otCwkLyTYx1MK/TIE3UmxHyNuWK/SIbgaqUF5bphYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735572790; c=relaxed/simple;
	bh=BiwcDEI2vECSei2cw+UtETBJRtoS+pSaYPD5QT/HKEw=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SnPft0xC3IS2wQM3HX4eYuITyiieSZxuvfAVI2Aqh4du6PgccoczwCZCUMy+8AOfzguncQRMiO/EoRadAcFPhGGStFYBUnrs4j+1agN4VRYzaqkHJkezUqaAJCzhQFIGfyPrceTZg4OsBqBkon4cP3q1DS/BQTN3G9BBgi1aT6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com; spf=pass smtp.mailfrom=ethancedwards.com; dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b=j4mmJMHO; arc=none smtp.client-ip=79.135.106.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="j4mmJMHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=protonmail3; t=1735572784; x=1735831984;
	bh=BiwcDEI2vECSei2cw+UtETBJRtoS+pSaYPD5QT/HKEw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=j4mmJMHOjOjYRZlx9iBUEXQsaiZ0fXqpGa2EaS+e68Ic4bqWCEhV4iFSdJIY1noEK
	 gbk4v58se2urPdE1ce7rXtu1CzxkZG+i+404+mub1rcMsGe/exynC5ybowq7m8un3+
	 t4H1j8m1RpPmffH5U8PihtA6xP3wMLrHJdJyrxM/cxHmbSN+WTVPdC4RwXCoqi0uA6
	 BsMqENkeh4ogdGqIPLZvw92YaTqrmtIN/Wl/zeLhsiOEo+eGckPptWLMGPbPeUzSn+
	 mNz20kv6AcCSTIHvs593bcyhKPq/cP88sPfDV0gVREMDPgVbrZd2t6+GkKiG38DhdX
	 +z6EVMrrXrNgQ==
Date: Mon, 30 Dec 2024 15:32:58 +0000
To: tiwai@suse.de
From: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: tiwai@suse.com, perex@perex.cz, arnd@arndb.de, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, ryan_richards@creativelabs.com, wychay@ctl.creative.com, Ethan Carter Edwards <ethan@ethancedwards.com>, David Laight <david.laight.linux@gmail.com>
Subject: [PATCH v2] ALSA: ctxfi: Simplify dao_clear_{left,right}_input() functions
Message-ID: <20241230153243.2874102-1-ethan@ethancedwards.com>
Feedback-ID: 28410670:user:proton
X-Pm-Message-ID: 9cf0945da37f615659ee72242c50eb6ef575ce11
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

There was a lote of code duplication in the dao_clear_left_input() and
dao_clear_right_input() functions. A new function, dao_clear_input(),
was created and now the left and right functions call it instead of
repeating themselves.

Link: https://lore.kernel.org/lkml/NyKCr2VHK_xCQDwNxFKKx2LVd2d_AC2f2j4eAvnD=
9uRPtb50i2AruCLOp6mHxsGiyYJ0Tgd3Z50Oy1JTi5gPhjd2WQM2skrv7asp3fLl8HU=3D@etha=
ncedwards.com/

Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
Co-developed-by: David Laight <david.laight.linux@gmail.com>
---
 Changes in V2: Fixed formatting caused by email client. Sorry!
 sound/pci/ctxfi/ctdaio.c | 50 ++++++++++++++--------------------------
 1 file changed, 17 insertions(+), 33 deletions(-)

diff --git a/sound/pci/ctxfi/ctdaio.c b/sound/pci/ctxfi/ctdaio.c
index 83aaf9441ef3..d46542d0b454 100644
--- a/sound/pci/ctxfi/ctdaio.c
+++ b/sound/pci/ctxfi/ctdaio.c
@@ -211,52 +211,36 @@ static int dao_set_right_input(struct dao *dao, struc=
t rsc *input)
 =09return 0;
 }
=20
-static int dao_clear_left_input(struct dao *dao)
+static int dao_clear_input(struct dao *dao, unsigned int start, unsigned i=
nt end)
 {
-=09struct imapper *entry;
-=09struct daio *daio =3D &dao->daio;
-=09int i;
+=09struct imapper *to_free =3D dao->imappers[start];
+=09unsigned int i;
=20
-=09if (!dao->imappers[0])
+=09if (!to_free)
 =09=09return 0;
-
-=09entry =3D dao->imappers[0];
-=09dao->mgr->imap_delete(dao->mgr, entry);
-=09/* Program conjugate resources */
-=09for (i =3D 1; i < daio->rscl.msr; i++) {
-=09=09entry =3D dao->imappers[i];
-=09=09dao->mgr->imap_delete(dao->mgr, entry);
+=09for (i =3D start; i < end; i++) {
+=09=09dao->mgr->imap_delete(dao->mgr, dao->imappers[i]);
 =09=09dao->imappers[i] =3D NULL;
 =09}
=20
-=09kfree(dao->imappers[0]);
-=09dao->imappers[0] =3D NULL;
-
+=09kfree(to_free);
 =09return 0;
 }
=20
-static int dao_clear_right_input(struct dao *dao)
-{
-=09struct imapper *entry;
-=09struct daio *daio =3D &dao->daio;
-=09int i;
=20
-=09if (!dao->imappers[daio->rscl.msr])
-=09=09return 0;
+static int dao_clear_left_input(struct dao *dao)
+{
+=09u32 offset =3D dao->daio.rscl.msr;
=20
-=09entry =3D dao->imappers[daio->rscl.msr];
-=09dao->mgr->imap_delete(dao->mgr, entry);
-=09/* Program conjugate resources */
-=09for (i =3D 1; i < daio->rscr.msr; i++) {
-=09=09entry =3D dao->imappers[daio->rscl.msr + i];
-=09=09dao->mgr->imap_delete(dao->mgr, entry);
-=09=09dao->imappers[daio->rscl.msr + i] =3D NULL;
-=09}
+=09return dao_clear_input(dao, 0, 0 + offset);
+}
=20
-=09kfree(dao->imappers[daio->rscl.msr]);
-=09dao->imappers[daio->rscl.msr] =3D NULL;
+static int dao_clear_right_input(struct dao *dao)
+{
+=09u32 start =3D dao->daio.rscl.msr;
+=09u32 offset =3D dao->daio.rscr.msr;
=20
-=09return 0;
+=09return dao_clear_input(dao, start, start + offset);
 }
=20
 static const struct dao_rsc_ops dao_ops =3D {
--=20
2.47.1


