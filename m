Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0D31C689D
	for <linux-sound@vger.kernel.org>; Sun, 15 Sep 2024 14:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726410303; cv=none; b=Fx+N/5l6O0bnzFUnLGoJ28g2wH/tnJcb94GncjDx5a0B9Lb2xHf6q2SfsvVgU6DJnFuUBRCuA+AtCUbRmh09f4kvZjM3qape8ZI1EBs/QriCxo+hIsLXCrcogEXnAANNyo6e8IRUUVh0YjXaD3/lCAFXfMxZZxIaT99mIGdT9ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726410303; c=relaxed/simple;
	bh=r7g5ISWmixGL4QM8dWSHN7rNxA/iD7YudMraIZydYHU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=aCQfdBo+3rdvoC+mXWB7IBXaeAfb3dfN7K/vVcIuFTYrVJzAF9pBs3n/P3EHjg4qrSUzHn9l4tns9BbjJ7zCbA3cIdLGvh132LU0+F1kTLLzECQivI+UjTrbDRIAkQWtves23PUs7rgLNRKwbTWMdYePV2kEHfzGF2ckZvdfwxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=dGlN9RLl; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="dGlN9RLl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1726410273; x=1727015073; i=markus.elfring@web.de;
	bh=PJrESKbpxGlpgHq9AuoQQs6G3hzXBydYlXg7Swc3pe4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=dGlN9RLliBiG/PgVIC6NBDiFC7bRXrE3R5z8Ch0M93PYpJwOinDZSsJm83xFVICH
	 6GXE06Nw4xae/p5hZhoisiBY4KaJt3GZk3SkPttLJPgUNjFAmKvR3eF0y96Choiim
	 BdtZiomjW+9Pbp+zQxXxQQ6k81zJJKuBeAOahBtShMyjof10bA+cNK+sspDViVUOu
	 UybPq1KRxwkkS8EvFwmtUWIAqX3S45ZBhNev/ir++fOW1N4VTBuBYw/uagved5eBv
	 A4LDSPgwPnOllSQ7N8W0mbo3t/Sdi8HKSZWv6bN3QeL2wKaLuNyJtRnspyrct8VOF
	 fl+JPlVyO3FMu2sY3g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MqIFF-1sBoSQ2f0V-00nn3G; Sun, 15
 Sep 2024 16:24:33 +0200
Message-ID: <c288ff88-4bb2-4d51-8fd5-2c626c3963b7@web.de>
Date: Sun, 15 Sep 2024 16:24:25 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Content-Language: en-GB
Cc: Julia Lawall <julia.lawall@inria.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] ALSA: emu10k1: Refactor copy_to_user() usage in
 snd_emu10k1_fx8010_ioctl()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oXmGRwNNPncgL+fMi5xKDARm506IUGWqdxDJSqDARqUkJ7wPlDM
 aVOLpXMg1S+Zqswn6OB2vkf/xmKNwQ68XPPqMhjCyhSb5KPfr3/gxQgcBBVN7l1v5O2HZrA
 WSHlO1YJe4lPIpqkK050z+vvs++XfPDhrdchfPkm2T9HAk0obB7SJPWaE50wN1AAWrN4eJL
 JQysJ10YDxO9VoJ8TCfuA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wEAAUkSgK1Y=;0TF16rlYgnuhZEgs3rtL0wZ9DXE
 9H35zT9lP5i2FwYeqla/YREgbtTByntlA1BuLfHwt5/D5ULkov5MMzvcNaNpFX4C8FffofDCl
 Q/M2XRbKA3LAcR/f+FU6Ti0vnnu7gX5niddkTaTtlqPks5m9uDbsNLdzXUhhrhFcPeB7tz965
 QSAqTYyv6+OOfEPaVFKeoS8P+JDWfcf5bMm/Tk2M08Xgx3JyQg5emfOabiHrqvviA+/bpAxaq
 8OHP/OMqMiU3D3Tv6cumyYH8h7hWqV0n1L3i3Opw1cUdygF0tOsbs1z2nDzxNAuqlnzbtFGx0
 08IYTTDjRkC9mJcrEzWZQ4i1Ni31KvE3FYiOpmIbzJvk0YX2Us4GFot3BV3S8uNXud9N3uran
 O4+Alohmq5PeF+ZYhXWIx2HO1TNbplNI2cRWzpgq6Ybviz8NZMRjzvejEbiwNmPt28KGdIlRn
 oweHbJgeEYhiSq7PCKAUH3YdPTGIe1MwOmleUts/w1D179N2lgPaEeaSpKJkDrxf/gvxFlWND
 jzzxtj37CS4MF3itIFJ5MW3Rd4aC1HHtkvWUVEvY1W6a+UnlAzdPRkERw72jaKlN6e8lIAsVX
 MHrU3aBIsWnu8Qf5CE9DvB44IIu/Q5DRVTD+3AHwPv5esOeirVgEfH+12jxBGhJEEZFgpcEpS
 3IJgbqqgpan2+3AvgnMdaG/qVlMxhPu0lfy6gcTqD1PSZReNDTjDlZXz1nUzkde+JHfcoGb0l
 0TxxxoubpBCPsIYGnJ6Nlk2tUM+kwsgcdxBkLgfSrBMMUtsloIsxwP3w04hFsCetsY4DdFiRm
 KC35Sy7Zy4tMmt7a3lAjtaxA==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Sep 2024 16:16:45 +0200

Assign values from selected expressions where copy_to_user() calls
are involved to additional local variables so that the number of
kfree() calls can be reduced accordingly.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 sound/pci/emu10k1/emufx.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 03efc317e05f..2f20878a78c9 100644
=2D-- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -2496,12 +2496,12 @@ static int snd_emu10k1_fx8010_ioctl(struct snd_hwd=
ep * hw, struct file *file, un
 		if (!info)
 			return -ENOMEM;
 		snd_emu10k1_fx8010_info(emu, info);
-		if (copy_to_user(argp, info, sizeof(*info))) {
+
+		{
+			unsigned long ctu =3D copy_to_user(argp, info, sizeof(*info));
 			kfree(info);
-			return -EFAULT;
+			return ctu ? -EFAULT : 0;
 		}
-		kfree(info);
-		return 0;
 	case SNDRV_EMU10K1_IOCTL_CODE_POKE:
 		if (!capable(CAP_SYS_ADMIN))
 			return -EPERM;
@@ -2517,12 +2517,12 @@ static int snd_emu10k1_fx8010_ioctl(struct snd_hwd=
ep * hw, struct file *file, un
 		if (IS_ERR(icode))
 			return PTR_ERR(icode);
 		res =3D snd_emu10k1_icode_peek(emu, icode);
-		if (res =3D=3D 0 && copy_to_user(argp, icode, sizeof(*icode))) {
+
+		{
+			bool ctu =3D res =3D=3D 0 && copy_to_user(argp, icode, sizeof(*icode))=
;
 			kfree(icode);
-			return -EFAULT;
+			return ctu ? -EFAULT : res;
 		}
-		kfree(icode);
-		return res;
 	case SNDRV_EMU10K1_IOCTL_PCM_POKE:
 		ipcm =3D memdup_user(argp, sizeof(*ipcm));
 		if (IS_ERR(ipcm))
@@ -2535,12 +2535,12 @@ static int snd_emu10k1_fx8010_ioctl(struct snd_hwd=
ep * hw, struct file *file, un
 		if (IS_ERR(ipcm))
 			return PTR_ERR(ipcm);
 		res =3D snd_emu10k1_ipcm_peek(emu, ipcm);
-		if (res =3D=3D 0 && copy_to_user(argp, ipcm, sizeof(*ipcm))) {
+
+		{
+			bool ctu =3D res =3D=3D 0 && copy_to_user(argp, ipcm, sizeof(*ipcm));
 			kfree(ipcm);
-			return -EFAULT;
+			return ctu ? -EFAULT : res;
 		}
-		kfree(ipcm);
-		return res;
 	case SNDRV_EMU10K1_IOCTL_TRAM_SETUP:
 		if (!capable(CAP_SYS_ADMIN))
 			return -EPERM;
=2D-
2.46.0

