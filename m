Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B2D22AE45
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 17:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757611296; cv=none; b=OS1YRpTRp0DvM6BQ/2hZtzCVCzYB64OesYZmiUOuHanrR3sTc6Vn0wcI91lLs6D8p5Ke5ANUKIbtJVcp+wSustVBEnOynsURuv8XF3qDgDPnNM6SSQD+S6DPe+MNFxcx+l6mBMQB5/CCDTf1ryu3ItpNtqCQBgzqMTuRBGLldv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757611296; c=relaxed/simple;
	bh=Z/POSQ34BJcdZOO9lRYYkrnNZpiSJAy4D/+m7XhZtDc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Lzc8m5TuKgIjyeQWwfqZqcs61xQ3KMVtN4+6IU1jYgenSGhnnFFqtTmqgQ2/Yw503sAvUojnfM+0S1H47oHXPkpQ7xlDT1aK9AT/QIx7tQ6R05NiBLq3r6z0XEBgnWFLPK+Prb0oMCY8RH6MHALwzy2U+lYWL7JNOY/IfZ+ypFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=faF4Myi2; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="faF4Myi2"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BHLFgj424964;
	Thu, 11 Sep 2025 12:21:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757611275;
	bh=85WtoiBUzbETvBdljqZz7Y0G6XClXtq3Z2YMPlf/Ejo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=faF4Myi2TNWM1xUGZasPOmIZiXWp2lVjt5igHK+1BSj3CCql7Yl9rIEiWkAj4aBVL
	 FDaQ3dr2JDl0Doj37+E6AS5bqFsVuz81fe7tTrBk5YVwvjKW04SA47vBKj9xbbbcnq
	 DiESAa3iyFjBil3JGsxrEE9HkYfoYabTENtDO//Y=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BHLEGB1321249
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 12:21:15 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 12:21:14 -0500
Received: from DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6]) by
 DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6%17]) with mapi id
 15.01.2507.055; Thu, 11 Sep 2025 12:21:14 -0500
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
Subject: RE: [EXTERNAL] Re: [PATCH v4 2/6] ASoC: ops: add
 snd_soc_get_volsw_clamped
Thread-Topic: [EXTERNAL] Re: [PATCH v4 2/6] ASoC: ops: add
 snd_soc_get_volsw_clamped
Thread-Index: AQHcIzTGtrot4u9snU+tU9Djxxbn0LSOeMqA//+3SrA=
Date: Thu, 11 Sep 2025 17:21:14 +0000
Message-ID: <41a87c2b7f21467d833b7eefde8e63a0@ti.com>
References: <20250911155704.2236-1-niranjan.hy@ti.com>
 <20250911155704.2236-2-niranjan.hy@ti.com>
 <652726cc-b286-4ba0-b49c-8b981d6d0244@sirena.org.uk>
In-Reply-To: <652726cc-b286-4ba0-b49c-8b981d6d0244@sirena.org.uk>
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
> Sent: Thursday, September 11, 2025 9:34 PM
> To: Holalu Yogendra, Niranjan <niranjan.hy@ti.com>
> Subject: Re: [PATCH v4 2/6] ASoC: ops: add
> snd_soc_get_volsw_clamped
>=20
> On Thu, Sep 11, 2025 at 09:26:59PM +0530, Niranjan H Y wrote:
> >   Add API snd_soc_get_volsw_clamped to read
> >   the volume from device. This similar to
> >   existing API snd_soc_get_volsw. But has
> >   additional step to clamp the value to max value
> >   if the register value is larger than max value.
>=20
> Why is this a separate API, what is the situation where we would want to
> report an invalid value from a control?  I was thinking of just adding
> this to the existing operations rather than adding separate ones that
> need to be explicitly set.
  Since few of the drivers as still using the original API, and was not sur=
e if
everyone wanted to clamp the register value, did not want to disturb the
original API snd_soc_get_volsw. Per my analysis, if register read fails due=
 to=20
some issue (like IO) and, for some reason if register value was modified
to have the value greater than mc->max value, the volume is report erroneou=
sly.
  Are you thinking that this patch could be dropped and clamp the value to =
max in =20
'soc_get_volsw' (as in 1st patch) and use the same API ? Please suggest.

Thanks,
Niranjan H Y


