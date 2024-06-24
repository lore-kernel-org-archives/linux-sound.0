Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911B2FBEF
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 20:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719259362; cv=none; b=W3L7FFWt9WTXrtrV1C8cdeMH33CKPhgLPqJm5KzLL2ZsDhxOW0HF3V9dhbIzGcKN/Eu7JGQtb/GCKSFGDItjsuUB1TIBFebpjeO7lmUy3Q1p3Vv0i1DhfFUJWECrY4qkPp+ugV2ZUJeGZhIKsBL9XthSPt6qisXqCEUCVNHVbzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719259362; c=relaxed/simple;
	bh=sNBA6aTtREl32QES5fAzpdPEekEbwQNl04mof1aosno=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nY7QCHO56rqlEmERcG3ZDJetdGc78zELbI8o7nQHSsYSLTSuyVCRGo4mpXPfYJ4MBn+41FwJ9QI+JGAuZ/rFgb05ZlaqvzEShDQJCuN8w/EJd5jN32YuVUg+poVmAxHK5Y0NevIGq86fkAYCkQpYrgEJb2sar1e2G7IskEQS7WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ttpf1raa; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ttpf1raa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719259358;
	bh=sNBA6aTtREl32QES5fAzpdPEekEbwQNl04mof1aosno=;
	h=Date:From:To:Cc:Subject:From;
	b=ttpf1raaH4YNK3WKzqDg+yhN/as2cV4bDROTs9yfX8/chi1kwav0uXzm/+duQMNUc
	 HWYn9D3EfelO585EESx++OzTFzQHalIRnfKuwphUUU+Hso30IZwL7mLAMa2IxwWD4j
	 sYlUMGqd+LPK0ue5kszCINcssTgueFY2yjpebuQa0bReZOWtdBNDfzkptmHcDdYzNm
	 DHcpJ8E6rOj4GESBCMoI1pvSsewdB3DYTlYSOktyWYK0K9J4umz5wNFw+89Bz+b21J
	 AfSrwV5p0gS7Y+ir2KLQ0uOuZtPhdHEwEhQOhnALzH0ieQx2CRWmyoUCfICsCK7tVo
	 w8PPrQOmNr2rw==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C283E3780530;
	Mon, 24 Jun 2024 20:02:35 +0000 (UTC)
Date: Mon, 24 Jun 2024 16:02:25 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: sound-open-firmware@alsa-project.org
Cc: linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>, kernel@collabora.com
Subject: ipc tx error from SOF on MT8195-Tomato
Message-ID: <bbce999f-7c88-4887-8854-ee29136587c9@notapiano>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

I'm looking through the error logs on the MT8195-Tomato platform and I see the
following errors during boot coming from SOF:

  sof-audio-of-mt8195 10803000.dsp: ipc tx error for 0x50040000 (msg/reply size: 124/124): -1040
  sof-audio-of-mt8195 10803000.dsp: kcontrol 9 read failed for widget CODEC_ADAPTER2.0
  sof-audio-of-mt8195 10803000.dsp: ipc tx error for 0x50040000 (msg/reply size: 144/144): -1040
  sof-audio-of-mt8195 10803000.dsp: kcontrol 9 read failed for widget CODEC_ADAPTER2.0
  sof-audio-of-mt8195 10803000.dsp: ipc tx error for 0x50040000 (msg/reply size: 124/124): -1040
  sof-audio-of-mt8195 10803000.dsp: kcontrol 1 read failed for widget CODEC_ADAPTER1.0
  sof-audio-of-mt8195 10803000.dsp: ipc tx error for 0x50040000 (msg/reply size: 144/144): -1040
  sof-audio-of-mt8195 10803000.dsp: kcontrol 1 read failed for widget CODEC_ADAPTER1.0

So apparently when setting up a kcontrol on those specific widgets, read fails
(although write succeeds, since that happens first in
sof_ipc3_widget_kcontrol_setup()).

Dumping some data I noticed that there are at least two other kcontrols being
setup on this platform (EQIIR1.0 and EQIIR2.0) and they are read fine, so it
looks to me that there is something wrong about these CODEC_ADAPTER widgets
specifically.

Does anyone know what is the problem here or where to investigate for it? I see
that the widget definitions come from the topology firmware [1] so I'm wondering
if there's a problem in that firmware.

Thanks,
Nícolas

[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg

FTR, full log at https://lava.collabora.dev/scheduler/job/14534804
