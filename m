Received: from mail-10625.protonmail.ch (mail-10625.protonmail.ch [79.135.106.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BAEA59
	for <linux-sound@vger.kernel.org>; Mon, 30 Dec 2024 05:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735535217; cv=none; b=Nj2vUMkhMNKqW+UVEXSANKSbBL9GEPF8D1Q5lVgQhPPMpa3/b7dbMfhaB+7dRDQfX8vwdlNejYYza+t17M2/uu7ylUJDRFbSwjDkQocMnJqxVxU+/KHYnx2Pv8ZBaLcahWPQifUDjsNGwiOTXoJQRCkmaxA5E/BvmA+tGWyECAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735535217; c=relaxed/simple;
	bh=5+Zs7PAC/Sq/9+SqtfPStEN8kzJl369O2vRSi9YYIZ4=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PqiAs2y1tM2Ool7fHDfUhO1PTPgLrLlKCS/aa1pZzQkC2FIvb9LDIJwen1BINoXcznJUnOmmRrx7Hfzc+a92XmCoEWjzb35/ZE5wKW2aj9NIaAkRH+x1X5sG0TaIysPPhvplZdqRiYpZP8Pm6M/zpx0+avIEMmgwWgewO2ATKaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com; spf=pass smtp.mailfrom=ethancedwards.com; dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b=YJ5mTYvN; arc=none smtp.client-ip=79.135.106.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="YJ5mTYvN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=protonmail3; t=1735535211; x=1735794411;
	bh=5+Zs7PAC/Sq/9+SqtfPStEN8kzJl369O2vRSi9YYIZ4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=YJ5mTYvNiioGhpDbIHkM0RYf7kfvHZ5gMpUXok8l9VuK07QEXOA+iExkenlj9+59Y
	 6VTvAHDNRhjDSiCpT4hcHrDCGFA6OPM7F4ALKKCwlwWUeiEtuESIE/6/lWATc29Ji/
	 7aEd/nKQa5D7Djl00Ydy4s6PCAwY8aaVdmens7LPRE/8QJfGbZ4KU5rC6H3l0hLyyv
	 m6021VMn8dUYUV7kahiYkwY4kwJQe+aDn9MKrWLESfExgofNww2rvLrgvj+JQpRUTL
	 mKiVHDMLcBJ4KfUF1ptCHeKYb+CW+B6Hdd45fG+gqm3cHPXf8L7+lxN9PP0Np2dWqF
	 LdkxXGQodoSqA==
Date: Mon, 30 Dec 2024 05:06:47 +0000
To: perex@perex.cz
From: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: tiwai@suse.com, arnd@arndb.de, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, ryan_richards@creativelabs.com, wychay@ctl.creative.com
Subject: [PATCH] ALSA: ctxfi: Simplify dao_clear_{left,right}_input() functions
Message-ID: <vxs3fuzdia52pcztueh7g3vug3mgl4s35p3yfwqjz3xh2kdmof@ib4s63vadpwk>
Feedback-ID: 28410670:user:proton
X-Pm-Message-ID: 0a033f8720ff3cef809a72c98d79dec388f48051
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
 sound/pci/ctxfi/ctdaio.c | 52 +++++++++++++---------------------------
 1 file changed, 17 insertions(+), 35 deletions(-)

diff --git a/sound/pci/ctxfi/ctdaio.c b/sound/pci/ctxfi/ctdaio.c
index 83aaf9441ef3..882afe451dc1 100644
--- a/sound/pci/ctxfi/ctdaio.c
+++ b/sound/pci/ctxfi/ctdaio.c
@@ -211,52 +211,34 @@ static int dao_set_right_input(struct dao *dao, struc=
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
-
-=09entry =3D dao->imappers[daio->rscl.msr];
-=09dao->mgr->imap_delete(dao->mgr, entry);
-=09/* Program conjugate resources */
-=09for (i =3D 1; i < daio->rscr.msr; i++) {
-=09=09entry =3D dao->imappers[daio->rscl.msr + i];
-=09=09dao->mgr->imap_delete(dao->mgr, entry);
-=09=09dao->imappers[daio->rscl.msr + i] =3D NULL;
-=09}
-
-=09kfree(dao->imappers[daio->rscl.msr]);
-=09dao->imappers[daio->rscl.msr] =3D NULL;
+static int dao_clear_left_input(struct dao *dao)
+{
+=09u32 offset =3D dao->daio.rscl.msr;
+
+=09return dao_clear_input(dao, 0, 0 + offset);
+}
=20
-=09return 0;
+static int dao_clear_right_input(struct dao *dao)
+{
+=09u32 start =3D dao->daio.rscl.msr;
+=09u32 offset =3D dao->daio.rscr.msr;
+
+=09return dao_clear_input(dao, start, start + offset);
 }
=20
 static const struct dao_rsc_ops dao_ops =3D {
--=20
2.47.1

