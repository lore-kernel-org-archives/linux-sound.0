Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AACB471431;
	Tue, 21 Jul 2026 20:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784664539; cv=pass; b=cDhf8+tneloiakgbhLbCXJ9pqwFbqBVs3VtntwvU052tLFiloi6XAUiQnNESs5uYAgICxyeKCYob+qE1pfmveCsQoPurmIBHkiU4wN6Vd5BNNyRqM3TLJnVSZoFIzDWMI8UQpgoynqSV8mPMC+fk5FZiNWbdXRcsA/m4KGiNU6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784664539; c=relaxed/simple;
	bh=mNWbMthKmMW63th/pfQ2qoUR883sKSX1x7UdcTAZgYg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BI/uLGt4MQtyxRr7fb5PdbrvqIzhd/zs//jRxc2l2bdNt4clw4yKrpLcqRr42JQE6FkElxqgBBnxoblvRWighW/H3TybXegCkg8fKuItND5uB+hGNjLquhe7PDCGlGnop2q31ZKUIm/IVqFjPYvDusFo0u5RSApUlBHwLsUzPdI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b=ZIoLZcbC; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b="ZIoLZcbC"
ARC-Seal: i=1; a=rsa-sha256; t=1784664513; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Xy48KQ0mMGbTfoOLAAlAqAutb66Xa9oYZ2WZZTv7KRn8zxCghiSp602Cu8fkWBJIRS/h4cUfHQA2ZpbjMtSH0KvWzYmF8lUlYs+ObeSsmGLG7z4NKjzH5IvqcnQfh58qq7JXvKQB+ZhqJc6zypedjcfUUQlKiGv1XMsU7LO3yL4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784664513; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=28n+EFe+6p+gax4GYXdCTcLZXvB/wD3zfATsjeRdS8E=; 
	b=mTSTRfyjSApfqAMNBZFZc5hH3tsd+UBCTy4m4aqtahoSCmfBlYqOo8pYsbURblqHWXV/Z0FvqwhcLbbO5PMx9vDTdAsHlETr854RC23BIgaDIdXfRIQROl4Ihy7zzaBEmnW4mnX7KGoZR1Hhe2lLEWbeDIbOvdtLn7DrhdQFALI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784664513;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=28n+EFe+6p+gax4GYXdCTcLZXvB/wD3zfATsjeRdS8E=;
	b=ZIoLZcbCEaG1eWFx9JzIXKiEZAjA+tKNIBGqAOPEWGy0+TbDnjxeQLrbS8eBIeQv
	bwWJz+ovoG5SrX1qTzaBIwNmSY2pMVJ0pi36qQe/nEbTxam9RI2bvZqqE/kuKtWJyLG
	YOCrAvLgQ3ShyH/nnBLwWBNGQtqAXZ25UujpS18M=
Received: by mx.zohomail.com with SMTPS id 1784664510931327.88888428224595;
	Tue, 21 Jul 2026 13:08:30 -0700 (PDT)
Message-ID: <55cecbcf049d3e95d3a6d0cd33004fbf6c7d01e1.camel@collabora.com>
Subject: Re: [PATCH] ASoC: cs35l41: Restore register state after system sleep
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: "Rhodes, David" <drhodes@opensource.cirrus.com>, Stefan Binding	
 <sbinding@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,  Jaroslav Kysela	
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Date: Tue, 21 Jul 2026 17:08:26 -0300
In-Reply-To: <a824dfcc-71cf-4ac9-b17c-563ba857cc83@opensource.cirrus.com>
References: <20260615-cs35l41-s4-support-v1-1-f5a21e35dd9e@collabora.com>
	 <adcf487e-a6c1-4439-b986-c421e206d6fe@opensource.cirrus.com>
	 <a824dfcc-71cf-4ac9-b17c-563ba857cc83@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

On Wed, 2026-06-17 at 12:40 -0500, Rhodes, David wrote:
> On 6/16/26 11:31 AM, Stefan Binding wrote:
> > Hi,
> >=20
> > I have some concerns about this patch.
> >=20
> > This driver is used for more than just the Steam Deck, so we would
> > need to ensure that this patch doesn't break those systems.
> > There are some potential complexities around cs35l41 with respect
> > to Boost and DSP enablement that need careful thought when
> > supporting system sleep.
> >=20
> > The HDA equivalent driver for cs35l41 does have support for system
> > sleep, but this driver works very differently.
> >=20
> > I recommend reaching out to David Rhodes <david.rhodes@cirrus.com>
> > for more information on the ASoC driver for CS35L41.
> > Please also cc patches@opensource.cirrus.com.
> >=20
> > Thanks,
> >=20
> > Stefan
> >=20
> > On 15/06/2026 15:54, N=C3=ADcolas F. R. A. Prado wrote:
> > > Currently, on the Steam Deck LCD when the system goes into
> > > hibernation
> > > and resumes back, the speakers are silent when playing with:
> > >=20
> > > =C2=A0=C2=A0 aplay -D plughw:acp5x,1 /usr/share/sounds/alsa/Front_Lef=
t.wav
> > >=20
> > > A crude workaround was to, after resuming the system, bypassing
> > > the
> > > regmap cache on the cs35l41 devices, before playing:
> > >=20
> > > =C2=A0=C2=A0 echo 1 > /sys/kernel/debug/regmap/spi-VLV1776\:00/cache_=
bypass
> > > =C2=A0=C2=A0 echo 1 > /sys/kernel/debug/regmap/spi-VLV1776\:01/cache_=
bypass
> > >=20
> > > That indicated that the hardware registers had gone out of sync
> > > with
> > > the regmap cache due to the power down in system hibernation.
> > >=20
> > > Fix the issue by, before system sleep, marking the regcache as
> > > cache
> > > only, and after system sleep, resetting the hardware and
> > > restoring the
> > > hardware registers from the regcache.
> > >=20
> > > This gets the sound working on the Steam Deck LCD after resume
> > > from S4.
> > >=20
> > > While the issue was only observed on S4 on this platform, the
> > > callbacks
> > > for suspend/resume are also set in the same way to account for
> > > platforms
> > > that might power down the chip on S3 as well.
> > >=20
> > > Note that this change does not take care of restoring the DSP
> > > state,
> > > since the affected platform does not use the DSP and it couldn't
> > > be
> > > tested, so it is only shut down on resume so it can be
> > > reinitialized in
> > > a future DSP preload event.
> > >=20
> > > Assisted-by: Copilot:claude-sonnet-4.6
> > > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>=20
> Hi Nicholas,
>=20
> I share Stefan's concerns about this patch affecting other devices. I
> also wonder if there is a less crude workaround for your system's
> behavior.
>=20
> The existing driver uses runtime_suspend/runtime_resume to enter and=20
> exit a low power 'hibernation' mode=20
> (wm_adsp_hibernate/cs35l41_enter_hibernate). In this mode the part
> will=20
> lose some configuration so the regmap is put into cache_only for the=20
> duration of the sleep and synced when waking up.
>=20
> Are you sure the device is not just missing a runtime_resume after
> the=20
> system is in S4? This whole sequence of sys operations should only be
> needed if the amp is completely losing power.

Hi David, Stefan,

The current PM runtime logic is to runtime-resume the device before
carrying out the system PM callbacks, and only allow runtime-suspend
after the system has resumed back. So during S4 the device is runtime-
resumed.

Also, since on my system the DSP is not used, the early return in the
runtime suspend/resume `if (!cs35l41->dsp.preloaded || !cs35l41-
>dsp.cs_dsp.running)` means that the runtime suspend/resume callbacks
are no-ops on my system.

Nonetheless, I tried simply marking the regcache dirty and syncing it
upon system resume, mimicking the runtime suspend/resume, as follows:

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 5001a546a3e7..5933d61753d8 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1445,6 +1445,9 @@ static int cs35l41_sys_suspend(struct device
*dev)
 {
        struct cs35l41_private *cs35l41 =3D dev_get_drvdata(dev);
=20
+       regcache_cache_only(cs35l41->regmap, true);
+       regcache_mark_dirty(cs35l41->regmap);
+
        dev_dbg(cs35l41->dev, "System suspend, disabling IRQ\n");
        disable_irq(cs35l41->irq);
=20
@@ -1474,10 +1477,23 @@ static int cs35l41_sys_resume_noirq(struct
device *dev)
 static int cs35l41_sys_resume(struct device *dev)
 {
        struct cs35l41_private *cs35l41 =3D dev_get_drvdata(dev);
+       int ret;
=20
        dev_dbg(cs35l41->dev, "System resume, reenabling IRQ\n");
        enable_irq(cs35l41->irq);
=20
+       regcache_cache_only(cs35l41->regmap, false);
+
+       /* Test key needs to be unlocked to allow the OTP settings to
re-apply */
+       cs35l41_test_key_unlock(cs35l41->dev, cs35l41->regmap);
+       ret =3D regcache_sync(cs35l41->regmap);
+       cs35l41_test_key_lock(cs35l41->dev, cs35l41->regmap);
+       if (ret) {
+               dev_err(cs35l41->dev, "Failed to restore register
cache: %d\n", ret);
+               return ret;
+       }
+       cs35l41_init_boost(cs35l41->dev, cs35l41->regmap, &cs35l41-
>hw_cfg);
+
        return 0;
 }


With just this change, the first playback after resume from S4 works,
but I see in dmesg:

[  133.019606] cs35l41 spi-VLV1776:00: Enable(0) failed: -110
[  133.019896] cs35l41 spi-VLV1776:00: ASoC: POST_PMD: Left Main AMP
event failed: -110
[  133.124515] cs35l41 spi-VLV1776:01: Enable(0) failed: -110
[  133.124831] cs35l41 spi-VLV1776:01: ASoC: POST_PMD: Right Main AMP
event failed: -110

Which points to CS35L41_IRQ1_STATUS1 reads timing out. Subsequent
attempts to playback sound are completely silent and the same error is
printed.

Given that my patch that fully reinitializes the hardware works, while
this doesn't, I'm inclined to believe that the chip loses power during
S4 indeed, at which point just restoring the register state is no
longer enough. But perhaps you could shed more light into this since
you're much more familiar with this hardware than I am.

Thanks,
N=C3=ADcolas
