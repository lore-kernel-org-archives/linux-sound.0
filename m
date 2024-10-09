Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9001E1C3E
	for <linux-sound@vger.kernel.org>; Wed,  9 Oct 2024 15:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728488102; cv=none; b=MtoxFPBWhVGqGmXj8jqHdyb02IoHeXN9khPgBt8Wu/n9DnHQG0/HCozeCmI8IelHQE0iz5rGUXqdmlKE1+Oaz7HKCmoHPh7IeI9fBYmioHDP17ceXdUVSRNX9kXV+uogEL9hvuo0BfO2XNB3ITYsNoS8yI1iHSd1sBBuJf6XLs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728488102; c=relaxed/simple;
	bh=ibr/a5QOJiRzat863oMI8WrrG293CBuujCDjn3QJxdY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cIi+W8rw5pHGWi6tmknC9ijYQqQP7LWyalpYNhUcSV7RUw4oSW0XADQXZajnOxD9pvgniqEHAbtO1tPDdJEVA5tvn6uCy3ST+jZUMAWvvqgxNTzPMwbOIlIJ5xP57aw4gOt8i0Q6LTLhn5eHwX0+CjaNSnCus3dQ3PZ4UAgVfLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from fedori.lan (51b68733.dsl.pool.telekom.hu [::ffff:81.182.135.51])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000716B8.000000006706A299.0023B102; Wed, 09 Oct 2024 17:34:49 +0200
Message-ID: <5aa8095d5fa9421100370ae039011893947af34b.camel@irl.hu>
Subject: Re: [PATCH 1/2] ALSA: hda: tas2781: Fix missing setup at runtime PM
From: Gergo Koteles <soyer@irl.hu>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org,
  Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>
Date: Wed, 09 Oct 2024 17:34:48 +0200
In-Reply-To: <878quxtjep.wl-tiwai@suse.de>
References: <20241008122658.9549-1-tiwai@suse.de>
	 <e104300e8eb8f069768a705cb4b05a9a479850a0.camel@irl.hu>
	 <878quxtjep.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-10-09 at 16:55 +0200, Takashi Iwai wrote:
> aOn Wed, 09 Oct 2024 16:32:52 +0200,
> Gergo Koteles wrote:
> >=20
> > Hi Takashi,
> >=20
> > On Tue, 2024-10-08 at 14:26 +0200, Takashi Iwai wrote:
> > > tas2781_runtime_suspend() clears the playback_started flag, hence it
> > > leads to inconsistent state after runtime suspend is triggered, as if
> > > the device hasn't been opened yet.  Also, the counterpart,
> > > alc2781_runtime_resume() doesn't call tasdevice_tuning_switch(), and
> > > this also causes the inconsistency.
> > >=20
> > > This patch corrects the superfluous flag clearance and the missing
> > > call.
> > >=20
> > > Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
> > > Link: https://bugzilla.suse.com/show_bug.cgi?id=3D1230132
> > > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > > ---
> > >  sound/pci/hda/tas2781_hda_i2c.c | 7 ++++---
> > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_=
hda_i2c.c
> > > index 370d847517f9..6d173b721fd0 100644
> > > --- a/sound/pci/hda/tas2781_hda_i2c.c
> > > +++ b/sound/pci/hda/tas2781_hda_i2c.c
> > > @@ -864,10 +864,8 @@ static int tas2781_runtime_suspend(struct device=
 *dev)
> > >  	/* The driver powers up the amplifiers at module load time.
> > >  	 * Stop the playback if it's unused.
> > >  	 */
> > > -	if (tas_hda->priv->playback_started) {
> > > +	if (tas_hda->priv->playback_started)
> > >  		tasdevice_tuning_switch(tas_hda->priv, 1);
> > > -		tas_hda->priv->playback_started =3D false;
> > > -	}
> > > =20
> >=20
> > This if-branch were added because I wanted to power up the amplifier at
> > module load time in tasdev_fw_ready() with:
> >=20
> >  tasdevice_tuning_switch(tas_hda->priv, 0);
> >  tas_hda->priv->playback_started =3D true;
> >=20
> > but I didn't want it to stay powered forever, if there aren't any=20
> > tas2781_hda_playback_hook() call with HDA_GEN_PCM_ACT_CLOSE action.
> >=20
> > This seemed like a good idea at the time because the music didn't have
> > to be restarted (for HDA_GEN_PCM_ACT_OPEN action) when the module was
> > reloaded. But this is a rare use case, today I don't think it's
> > important to have it in there.
> >=20
> > In general cases, tas2781_hda_playback_hook() turns the amplifier on
> > and off, and sets the playback_started flag.
> > If I understand correctly, the playback_started will be off at the time
> > of runtime_suspend()/runtime_resume() calls.
> >=20
> > So I think the mentioned two lines from the tasdev_fw_ready() function
> > and the mentioned if-branch can be deleted.
>=20
> Ah, right, there is a tweak of runtime PM there, which makes harder to
> track the state change...
> Can we just drop the amp in tasdev_fw_ready()?=C2=A0
>=20

I think, yes. I tested it with TAS2563 (Lenovo Yoga 7 14ARB7 Laptop).

> Then the whole runtime
> suspend can be dropped.  And, the conditional amp off/on can be moved
> again back to the system suspend/resume.  That makes less confusing.
>=20

The runtime_resume() checks whether "Speaker Program Id" kcontrol (as
cur_prog variable) has changed with tasdevice_prmg_load() function. If
so, updates it, so I don't think it can be dropped easily without
moving this functionality somewhere else.

I'm not sure if the calibration data needs to be updated before each
power-up or only after a program change.


Thanks,
Gergo Koteles

