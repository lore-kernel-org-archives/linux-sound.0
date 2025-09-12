Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACA32877D9
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 08:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757666181; cv=none; b=GbDMNVYcT/8dLG0calOQPlI0iDpcIqRbeaj1xBGp/n/5rRNU2sUHFpvyXjTCX8sVS2Co8/E+B19CMcL06Q5bNEjhXfGmYpuXg8CKwWxktZ/jwkp5xiNuIAFib9J+WElXJgmXezhYjDeozi4mm+rK75yfvD40kMzlz11T6TD0VLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757666181; c=relaxed/simple;
	bh=FnpuK3dx9xrRthH3rxPyUPMIEelJfbDZD2xw508+LpI=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=a3mMAVd0S0b3koghzvUAyb6afkh0EgdmVK81vjZ91n7T8yEc1TOGj9w6GtwNRobMa91OtjRlVjv0DFWVFdw5SKyEZ/KXkkUhxRHUOZb7xEv1VKr98TTlzZm2IS0ROQwZk9+KSVwzT5TyOrcAG9+p5qmflNQcY9OHp8+F6OIV+Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aM0WU+4r; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aM0WU+4r"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58C8ZrCv481885;
	Fri, 12 Sep 2025 03:35:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757666153;
	bh=vnvE9Tmy+8RZpuEpasCHWpNmyOCrn64qxskEM9TbF1A=;
	h=From:To:CC:Subject:Date;
	b=aM0WU+4rOhOUJpBTaBPkR+mKOu6BdTvsmQ/6QWZign0lAmOjOXFfMPvdgeobbkUQS
	 l7FIgPLTT3AbEnozUPdz/qMOb0JAbfL+5AZ5MFtMDvsxVMwKptMsgf2+I6PLq2G1Bw
	 nAfecr0LGpkqO1uHLZ+W0bKhEnmUf140sU8mbQoo=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58C8Zr9d2638887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 03:35:53 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 03:35:52 -0500
Received: from DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6]) by
 DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6%17]) with mapi id
 15.01.2507.055; Fri, 12 Sep 2025 03:35:52 -0500
From: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
To: Mark Brown <broonie@kernel.org>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "perex@perex.cz"
	<perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
        "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
        "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
        "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
        "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
        "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
        "pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>,
        "Navada
 Kanyana, Mukund" <navada@ti.com>,
        "Ding, Shenghao" <shenghao-ding@ti.com>,
        "Hampiholi, Vallabha" <v-hampiholi@ti.com>,
        "Xu, Baojun" <baojun.xu@ti.com>
Subject: Re: [PATCH v4 2/6] ASoC: ops: add snd_soc_get_volsw_clamped
Thread-Topic: [PATCH v4 2/6] ASoC: ops: add snd_soc_get_volsw_clamped
Thread-Index: AdwjvjTZ0GpSGTcuTVKLGIWH//vGnw==
Date: Fri, 12 Sep 2025 08:35:52 +0000
Message-ID: <a4b19a5b780a4cf2a5b6cddf01f7a1ad@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

> From: Mark Brown <broonie@kernel.org>
> Sent: Friday, September 12, 2025 12:02 AM
> Subject: Re: [EXTERNAL] Re: [PATCH v4 2/6] ASoC: ops: add
> snd_soc_get_volsw_clamped
>=20
> On Thu, Sep 11, 2025 at 05:21:14PM +0000, Holalu Yogendra, Niranjan wrote=
:
> > > From: Mark Brown <broonie@kernel.org>
>=20
> >   Since few of the drivers as still using the original API, and was not=
 sure if
> > everyone wanted to clamp the register value, did not want to disturb th=
e
> > original API snd_soc_get_volsw. Per my analysis, if register read fails=
 due to
> In what situation would anything want to report an invalid value?
I am not sure if I fully follow. But in my case, for one of the cases,
valid amp volume is 0x0 to 0x14 with mask 0x1f - so if the register value r=
ead is
0x15 to 0x1f, it is invalid. But in the next patch, I will add the logic to=
 clamp the value.

> > Are you thinking that this patch could be dropped and clamp the value t=
o max in =20
> > 'soc_get_volsw' (as in 1st patch) and use the same API ? Please suggest=
.
> Yes, everything should report valid values.  I/O errors should be
> propagated as errors.
I will update the next patch accordingly.=20

Thanks=20
Niranjan H Y
