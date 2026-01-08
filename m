Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF915361DB1
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 08:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767861207; cv=none; b=HmEAFYk5wK3rjwZbaJGkHYHiNqfVLMefwV3j1WDyQN7GY4RTc+1nWJYprZ3XjFRqGp29kkxSXPuGDDR3gHApG9nmNMeBOwKSUYJhp/uFUgzsUYZ7MikkD7n9AHuwp9ib/+5lJbpT8fEfhSwwurOB0Xqqfo9i0kFhIH6OnYrUDUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767861207; c=relaxed/simple;
	bh=9NdMjoSpp2dyvf51vCQPCmle9CodN2y7RmbReWuLvo4=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=F27VLJViNVd4JeGOlGmbel56J1a4avlNSBshZf5axxf1ClCX+l3zert2/rwvKf4+1cl0Q0mEFCailK7R1VTfSNLrT1cd47S0SQtGr74kgP4mHw+7IMZ46SzCZZhrka3Lr9tWh4ZCJmk17e9gf6mhcBLfv0a5zyhHiwK7BduV6Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=US9xLUjf; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="US9xLUjf"
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767861176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jeV/S73XsQ5lsdc5FWy0zowTJVq63DgCKSEyzBGq8cc=;
	b=US9xLUjf37HQxY0GBMdVyaWthVRFlAVYIs22iGmsp6r9s1BBR7AJBCGaAFirS4RM20QbSa
	JYQsLynsim4dRA29BHQVxgpUVjXC6azhrmweTBkhuXPnrFDV3npBBUmkJGBw8EWrQyLoj3
	PHCaE3QvZ/fX0gvNNVi1V4ComoRxqeU=
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matthew Schwartz <matthew.schwartz@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] ALSA: hda/tas2781: Skip UEFI calibration on ASUS ROG Xbox Ally X
Date: Thu, 8 Jan 2026 00:32:42 -0800
Message-Id: <CF1B6FE8-28D0-4CC0-ABF3-98399938366F@linux.dev>
References: <CAGwozwH=aB76uq1OSJmBijMT1WY4XK6m3Av5qyecVLkjqzTrXA@mail.gmail.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 tiwai@suse.de, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
In-Reply-To: <CAGwozwH=aB76uq1OSJmBijMT1WY4XK6m3Av5qyecVLkjqzTrXA@mail.gmail.com>
To: Antheas Kapenekakis <lkml@antheas.dev>
X-Migadu-Flow: FLOW_OUT



> On Jan 8, 2026, at 12:14=E2=80=AFAM, Antheas Kapenekakis <lkml@antheas.dev=
> wrote:
>=20
> =EF=BB=BFOn Thu, 8 Jan 2026 at 07:44, Matthew Schwartz
> <matthew.schwartz@linux.dev> wrote:
>>=20
>> According to TI, there is an issue with the UEFI calibration result on
>> some devices where the calibration can cause audio dropouts and other
>> quality issues. The ASUS ROG Xbox Ally X (RC73XA) is one such device.
>>=20
>> Skipping the UEFI calibration result and using the fallback in the DSP
>> firmware fixes the audio issues.
>>=20
>> Fixes: 945865a0ddf3 ("ALSA: hda/tas2781: fix speaker id retrieval for mul=
tiple probes")
>> Cc: stable@vger.kernel.org # 6.18
>> Link: https://lore.kernel.org/all/160aef32646c4d5498cbfd624fd683cc@ti.com=
/
>> Closes: https://lore.kernel.org/all/0ba100d0-9b6f-4a3b-bffa-61abe1b46cd5@=
linux.dev/
>> Suggested-by: Baojun Xu <baojun.xu@ti.com>
>> Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
>=20
> Hi,
>=20
> can you remove the Fixes? Commit 945865a0ddf3 is not related or caused
> this issue.

I chose Fixes with that particular commit because prior to this, when there w=
ere no kernel patches for the device, the functional audio issue did not occ=
ur. But I can see your point because technically it wasn=E2=80=99t using the=
 firmware at all, so I can remove it for a v2.

>=20
> My interpretation of Jim's email was that he wanted to do a root cause
> analysis and e.g. find out that it is the UEFI parser. Which it is.

If further root cause analysis is wanted by TI from us then I=E2=80=99d like=
 to them to clarify that first. I interpreted Takashi=E2=80=99s email as sug=
gesting this was sufficient for now as a =E2=80=9Ctrivial fix=E2=80=9D, base=
d on Jim=E2=80=99s email and the fact it worked.=20

>=20
> The device does not have this issue in Windows, so it is not clear
> that there is an issue with the calibration data such that the proper
> fix is to ignore it. And I do not think this was suggested by TI. In
> addition, your patch introduces a quirk for TAS, even if temporary.
>=20
> Therefore, you should update the commit text to state that there is
> currently a regression in UEFI calibration data parsing for TAS
> devices, and until the parser is properly fixed, adding a quirk allows
> for restoring full functionality in affected devices, such as the ROG
> Xbox Ally X.

Sure, can do.

Matt

>=20
> With those and as a temporary fix, this is fine to be merged by me
>=20
> Best,
> Antheas
>=20
>> ---
>> sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 13 ++++++++++++-
>> 1 file changed, 12 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/c=
odecs/side-codecs/tas2781_hda_i2c.c
>> index c8619995b1d7..ec3761050cab 100644
>> --- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
>> +++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
>> @@ -60,6 +60,7 @@ struct tas2781_hda_i2c_priv {
>>        int (*save_calibration)(struct tas2781_hda *h);
>>=20
>>        int hda_chip_id;
>> +       bool skip_calibration;
>> };
>>=20
>> static int tas2781_get_i2c_res(struct acpi_resource *ares, void *data)
>> @@ -489,7 +490,8 @@ static void tasdevice_dspfw_init(void *context)
>>        /* If calibrated data occurs error, dsp will still works with defa=
ult
>>         * calibrated data inside algo.
>>         */
>> -       hda_priv->save_calibration(tas_hda);
>> +       if (!hda_priv->skip_calibration)
>> +               hda_priv->save_calibration(tas_hda);
>> }
>>=20
>> static void tasdev_fw_ready(const struct firmware *fmw, void *context)
>> @@ -546,6 +548,7 @@ static int tas2781_hda_bind(struct device *dev, struc=
t device *master,
>>        void *master_data)
>> {
>>        struct tas2781_hda *tas_hda =3D dev_get_drvdata(dev);
>> +       struct tas2781_hda_i2c_priv *hda_priv =3D tas_hda->hda_priv;
>>        struct hda_component_parent *parent =3D master_data;
>>        struct hda_component *comp;
>>        struct hda_codec *codec;
>> @@ -571,6 +574,14 @@ static int tas2781_hda_bind(struct device *dev, stru=
ct device *master,
>>                break;
>>        }
>>=20
>> +       /*
>> +        * ASUS ROG Xbox Ally X (RC73XA) UEFI calibration data
>> +        * causes audio dropouts during playback, use fallback data
>> +        * from DSP firmware instead.
>> +        */
>> +       if (codec->core.subsystem_id =3D=3D 0x10431384)
>> +               hda_priv->skip_calibration =3D true;
>> +
>>        pm_runtime_get_sync(dev);
>>=20
>>        comp->dev =3D dev;
>> --
>> 2.52.0
>>=20
>>=20
>=20
