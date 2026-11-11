Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.236.53.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379028;
	b=z/TDuKPtBH7kilK9JtDjWj0EUtbUtwAG+tyT3LK40/6uLPBZ3d5wuCRp/Njb2xHTMTC8
	 9p/tFe3TABzE4DszgkU9GVC6zdOPh7ueiidVwB9fScPb9lGg8cwZEtJpUBMLeLOUblWWk
	 fu2B+Jhr3sHjB27J3jivFz5Ijov3giO+T3SyUaqxZ37MJC69/HIcj0d50sbZDAcPh6z74
	 Uf2zvGuBJ699sPryUVviFvTxyZJMInARjdmyMZjioG5uKm/At+M950G8n5NNk1zwrVJqp
	 UxVf/i2+CoMPZMlMu8GBxqZynV26ZDf1SsGr4BdRZHefdBP5RC4ziNnWacv+E5/tzKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379028;
	h=DMARC-Filter:Received:From:To:Cc:References:In-Reply-To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:Thread-Index:Content-Language:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=Bvs8GpZh4moZyvyVr97Ot7SRLclEDegi/LB1EMSseN8=;
	b=sj943eO6Ni5DW09tBYmmGdwrH6udf5Yhxd1ex2rI+RKwPFDAoCC89SLCPyVCf8HknSdJ
	 ifuF6PH2UuOvCSxIbklMlwZWidY1SaxAKPKNiP5qEq9Ax3LItfthAS3yQ7wKNbgRs+vQ+
	 FeuTDamc3XGzdJ5MOZDKZpzzBdvRDCpxgpbyyQeLwx34md4rtU9+NTZsznygvDyE+EeJk
	 iEud6Tw2XWDn1usE29fzNWG0fsQoagyBBi1tFb3cuBWesH8aL1XQTjkocnZcGXLdOKWzK
	 YWhRJudCT86Tajm1YAbggEw6idM9Nw5Sf5V3yzg4M9Lng+6fIm2F7oLxMzw0kuax05A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=senarytech.com;
	spf=pass smtp.mailfrom=senarytech.com;
	dkim=pass header.d=senarytech.com header.i=@senarytech.com header.a=rsa-sha256 header.s=default header.b="es/hf0ZA";
	arc=none smtp.remote-ip=160.236.53.11
Received: from mail-m1602365311.xmail.ntesmail.com (mail-m1602365311.xmail.ntesmail.com [160.236.53.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED1F606A31C
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 06:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ED1F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=senarytech.com header.i=@senarytech.com header.a=rsa-sha256 header.s=default header.b=es/hf0ZA
Received: from Wangqianghua (unknown [27.38.136.138])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54449bcc9;
	Wed, 11 Nov 2026 14:36:53 +0800 (GMT+08:00)
From: <qianghua.wang@senarytech.com>
To: "'Liao, Bard'" <bard.liao@intel.com>,
	"'Mark Brown'" <broonie@kernel.org>
Cc: <linux-sound@vger.kernel.org>,
	"'Liam Girdwood'" <lgirdwood@gmail.com>,
	"'Jaroslav Kysela'" <perex@perex.cz>,
	"'Takashi Iwai'" <tiwai@suse.com>,
	"'Rojewski, Cezary'" <cezary.rojewski@intel.com>,
	"'Peter Ujfalusi'" <peter.ujfalusi@linux.intel.com>,
	"'Bard Liao'" <yung-chuan.liao@linux.intel.com>,
	"'Kai Vehmanen'" <kai.vehmanen@linux.intel.com>,
	"'Pierre-Louis Bossart'" <pierre-louis.bossart@linux.dev>,
	"'bo liu'" <bo.liu@senarytech.com>
References: <20261110073420.842175-1-qianghua.wang@senarytech.com> <20261110080535.870596-1-qianghua.wang@senarytech.com> <SJ2PR11MB8424FE5B64FEDEDA5F947D30FF722@SJ2PR11MB8424.namprd11.prod.outlook.com>
In-Reply-To: <SJ2PR11MB8424FE5B64FEDEDA5F947D30FF722@SJ2PR11MB8424.namprd11.prod.outlook.com>
Subject: reply [PATCH v2] ASoC: sdw_utils: senary: handle a missing name_prefix
Date: Wed, 11 Nov 2026 14:36:53 +0800
Message-ID: <004501dd71a7$0b2e3e40$218abac0$@senarytech.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Ad1xpwbbXoQoBkwERyWYEldO4sjEyw==
Content-Language: zh-cn
X-HM-Tid: 0aa1c952dd4609d8kunm031195853daddf
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZQx8ZVh5OTBkaTR5ITE9KH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlJTFVIQ1VKSE1VSkhDWVdZFhoPEhUdFFlBWU9LSFVCQk
	lOS1VKS0tVSkJLQlkG
DKIM-Signature: a=rsa-sha256;
	b=es/hf0ZAA9ti2w8Zz+0BOr7pG3rYHaVK/0ls/+9eSLfVZRkNDOCh4R3bH9jVMvx/sejqIe4QqM0SlY33WfxIsgeMCHs3nW4RRb5gXF97u3Cl78rhPPj3iMxEaVUjb6hoF4WGgDQOzG6JtBvy/T2JfaIL3gb9FIvvxwHmBDxs5Ig=; s=default; c=relaxed/relaxed; d=senarytech.com; v=1;
	bh=Bvs8GpZh4moZyvyVr97Ot7SRLclEDegi/LB1EMSseN8=;
	h=date:mime-version:subject:message-id:from;

Hi Bard,
	Thanks for the review. I agree the right fix is to ensure
name_prefix is set via codec_conf / component probe, not to paper over =
NULL
in sdw_utils.
The v2 follow-up was based on debug logs and instrumentation from =
jfdnet, a
community contributor on GitHub issue #6012. We have not reproduced this =
on
SN6245 hardware ourselves yet (SN6244 only in our lab).
Please hold off on reviewing or merging
[PATCH v2] ASoC: sdw_utils: senary: handle a missing name_prefix until =
we
have the same hardware and can test and align the fix locally.=20
I will follow up after that.
Thanks,
Qianghua Wang

From: Liao, Bard <bard.liao@intel.com>=20
Sent: 2026=C4=EA11=D4=C210=C8=D5 22:45
To: Qianghua Wang <qianghua.wang@senarytech.com>; Mark Brown
<broonie@kernel.org>
cc: linux-sound@vger.kernel.org; Liam Girdwood <lgirdwood@gmail.com>;
Jaroslav Kysela <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>; =
Rojewski,
Cezary <cezary.rojewski@intel.com>; Peter Ujfalusi
<peter.ujfalusi@linux.intel.com>; Bard Liao
<yung-chuan.liao@linux.intel.com>; Kai Vehmanen
<kai.vehmanen@linux.intel.com>; Pierre-Louis Bossart
<pierre-louis.bossart@linux.dev>; bo liu <bo.liu@senarytech.com>
Subject: RE: [PATCH v2] ASoC: sdw_utils: senary: handle a missing
name_prefix

> -----Original Message-----
> From: Qianghua Wang <qianghua.wang@senarytech.com>
> Sent: Tuesday, November 10, 2026 4:06 PM
> To: Mark Brown <broonie@kernel.org>
> Cc: linux-sound@vger.kernel.org; Liam Girdwood <lgirdwood@gmail.com>;=20
> Jaroslav Kysela <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>;=20
> Rojewski, Cezary <cezary.rojewski@intel.com>; Peter Ujfalusi=20
> <peter.ujfalusi@linux.intel.com>; Bard Liao=20
> <yung-chuan.liao@linux.intel.com>;
> Kai Vehmanen <kai.vehmanen@linux.intel.com>; Pierre-Louis Bossart=20
> <pierre- louis.bossart@linux.dev>; bo liu <bo.liu@senarytech.com>;=20
> Qianghua Wang <qianghua.wang@senarytech.com>
> Subject: [PATCH v2] ASoC: sdw_utils: senary: handle a missing=20
> name_prefix
>=20
> asoc_sdw_senary_sdca_jack_rtd_init() passes component->name_prefix to=20
> strstr(). When codec_conf does not apply the prefix, name_prefix is=20
> NULL and card registration oopses.

In what case will codec_conf not apply the prefix?
Won't it be better to ensure that the name_prefix is always set?



