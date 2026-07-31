Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9DE3B893A
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 14:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785507352; cv=none; b=hL97CQLu8NjwomBe0R7Xd2q7K+5rpYcaNVhoXka+AbyepLMSBKp0Lr3+L5Bf/nPCWS4IKdTUaD4A+5isUvmZ5/0++vXa8VBzFGHoD7aKcOMfy0X/3mvYgZMFQl13g2jyZTgJ2ZTfRfAahUvUCq739yOZTbYaRiY4T3oMx40c+dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785507352; c=relaxed/simple;
	bh=AHKqztTfFhVrd4w5g5zYZEO52A1livCXzZG15T6xJdE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BJ8fGTakBi/0emBWpA+jMaLONSh1dWGtAsGkEmq+T/IdpdrozqYIEqlfibUgPE1qGeRlagPTlAAOfqttAQDa5c3Rt/jE8cLCp4sV3As14yd42e5W/DuDOxNiDnshm26NOPNjKi7gPA1a4GtTdQtq4s364VGq9loRkkljd4SZ2MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQLQiBSw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQLQiBSw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785507351; x=1817043351;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=AHKqztTfFhVrd4w5g5zYZEO52A1livCXzZG15T6xJdE=;
  b=lQLQiBSwAKHyMOma13VUOV4TytOZuq3ElO35xkP+pQx8/eN1xfohUkKn
   JpNieoFVUaxoyu3oa12mZr88rqL+1swaX9Hcc0iVjfsMnJXphFZWpWbmr
   56E/9w80YguosKuzSVdApFDzcPi2Nep7yFm8g1e584/BwNThjMST/WyZt
   t2axNJAYofDCWTAxFPy516BDtBZZ83DOm9mWgq+0uhaOtZfODmmjQ+NO2
   2Q/CW9RZiHEGAyvPzl298Q0qM4IH1UJWspaYMATdRRjjDWSTM0ij5u9Z6
   4SxV1wSmQdrhuWmRtllpZnjS/htZML5527o4DKY4CScxxp+sKOPLLugqP
   A==;
X-CSE-ConnectionGUID: QqzPx3dsSku5JfeKnIOu3w==
X-CSE-MsgGUID: FH+3mJ6NSKKDuMWp9X9Lsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="96792455"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="96792455"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 07:15:50 -0700
X-CSE-ConnectionGUID: 85seilK9QhmJ2Qz29KflCA==
X-CSE-MsgGUID: q8ffHDlNR2eE5FHup1P8Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="260651649"
Received: from amilburn-desk.amilburn-desk ([10.245.244.62])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 07:15:48 -0700
Message-ID: <558c64d82820c05c3c2e3ff477289a3dc8453d47.camel@linux.intel.com>
Subject: Re: [PATCH 4/6] ASoC: SOF: ipc4-topology: Add payload to pipeline
 create messages
From: Jyri Sarha <jyri.sarha@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, Peter Ujfalusi
	 <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
	kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com, 
	pierre-louis.bossart@linux.dev
Date: Fri, 31 Jul 2026 17:15:28 +0300
In-Reply-To: <13cce21a-d750-46a4-8072-7a40863ca04c@sirena.org.uk>
References: <20260730104141.14817-1-peter.ujfalusi@linux.intel.com>
	 <20260730104141.14817-5-peter.ujfalusi@linux.intel.com>
	 <13cce21a-d750-46a4-8072-7a40863ca04c@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-07-31 at 00:37 +0100, Mark Brown wrote:
> On Thu, Jul 30, 2026 at 01:41:39PM +0300, Peter Ujfalusi wrote:
>=20
> > +	/*
> > +	 * If this is not a Data Processing module instance, add
> > the
> > +	 * required heap sizes to the sum of all module instances
> > belonging
> > +	 * to the same pipeline, and find the maximum stack
> > requirement
> > +	 * among all module instances belonging to the same
> > pipeline.
> > +	 */
> > +	if (swidget->comp_domain !=3D SOF_COMP_DOMAIN_DP) {
>=20
> Does this DTRT if the comp_domain was read from the manifest?
>=20

Linux driver does not do that, but the SOF FW is supposed to, and it
will give an IPC error if the module cannot be configured as a DP
module. E.g. the topology should be compatible with the firmware build,
and if it's not, there is nothing the Linux driver can do about it but
fail.

> > +static void sof_ipc4_widget_pipe_ext_obj_memory_data(struct
> > snd_sof_dev *sdev,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 struct
> > snd_sof_widget *swidget,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 u32 *payload,
> > u32 *ext_pos,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 struct
> > sof_ipc4_glb_pipe_ext_object **hdr)
> > +{
>=20
> > +	mem_data->domain_id =3D swidget->domain_id;
>=20
> Do we need SOF_COMP_EXT_TOKENS in pipeline_token_list to parse the
> domain ID?

Not for the moment. We could indeed add its parsing to pipeline nodes,
but for the moment the domain_id IPC field in the pipeline message is
for future use, and the default 0 for the default memory domain is all
we need for the pipelines ATM. The FW is not yet, or in the near
future, ready to assign different memory domains for different
pipelines.

Best regards,
Jyri
