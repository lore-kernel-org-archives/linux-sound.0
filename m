Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486CA14A600;
	Thu, 13 Jun 2024 17:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718301323; cv=none; b=LifCl/DiGc5YYJ3ClPGR5f1bc9L5fAcEyROVXTCeRPDVpQO96+SQVm890YuuUOyYPL4G5IbcPGKXdfO1pCd+/ZcvHAvcwYca/5UUlEuhwac7JeWQocUy0maL+RGxaltYOwAXQtCdeIJ6PGB7LT+OXwR1AddjZIWd4qRRkFbEjos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718301323; c=relaxed/simple;
	bh=Cm1F7DrFVmLxVeLuslcdarzknUOh0alu2igejGkxoFs=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OugAhQF3X4+O41aQWdP4QZT3qLM5Nx/7fjxa/qhB0ZBWdEfQ9XoXDYwW2CS29jfplX+t5jQLjMGQXNGqGzx1xpvYKicOV2xQbRWvT3iUEMuI0lEWs0wBo5VG0d6UDScnqrMCJtaWo/2vjc+XRmiMZCmRASByeY6PZx0J2gleAkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=SkcOTHGi; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="SkcOTHGi"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45DHBJKq025047;
	Thu, 13 Jun 2024 12:55:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=/BVJql68tB9ajAkIWj
	QdkSFeuEec4LfGBBsvoG3oFPs=; b=SkcOTHGih5o+AoVEZp2ayUP6Ns26213Fnm
	f9GqeZOHKwETT+nT1pPJNbzj5sKWNwRQ/6nEbxkKP9bRnbBd7LIrNzlECAthnvGR
	LpbTsABkOej+5NCh+ae/NN+tDA9Asiy1YaG6GoX9vVKIkQBvmKSbmwA+viFMqcs9
	m02mZk+AHUQTP5++wfQcH5xhu3eJhFkyI5uHsypy+TsW9U4yUzcrixL+iafpYV7u
	HQoDbxv3LUeKJWV/fxdre4SEwtsJet0d1X9/35xFwADC7sIe6vVP7JWiqux18cZC
	CmNokSh5uyANsVY9yuXQzbsc6ZhubKbDM1/e4ibspH7B8ez9aDXA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3yqb8ehqea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 12:55:18 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Jun
 2024 18:55:16 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 13 Jun 2024 18:55:16 +0100
Received: by ediswmail9.ad.cirrus.com (Postfix, from userid 15641)
	id 7158A820248; Thu, 13 Jun 2024 17:55:16 +0000 (UTC)
Date: Thu, 13 Jun 2024 17:55:16 +0000
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/2] ASoC: cs530x: Support for cs530x ADCs
Message-ID: <ZmsyhKiuRI1Dg8l4@ediswmail9.ad.cirrus.com>
References: <20240607202708.335752-1-paulha@opensource.cirrus.com>
 <20240607202708.335752-3-paulha@opensource.cirrus.com>
 <9876e617-68d1-4e1c-ba9e-2c235a57b0a9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9876e617-68d1-4e1c-ba9e-2c235a57b0a9@kernel.org>
X-Proofpoint-ORIG-GUID: 48Rp6eEWt1eWQhJbVWmtHxlF84atXJKz
X-Proofpoint-GUID: 48Rp6eEWt1eWQhJbVWmtHxlF84atXJKz
X-Proofpoint-Spam-Reason: safe

On Mon, Jun 10, 2024 at 10:46:26AM +0200, Krzysztof Kozlowski wrote:
> > +
> > +	cs530x = devm_kzalloc(&client->dev, sizeof(struct cs530x_priv),
> 
> sizeof(*)
> 
Ack

> > +
> > +	if (client->dev.of_node) {
> > +		const struct of_device_id *match;
> > +
> > +		match = of_match_node(cs530x_of_match, client->dev.of_node);
> > +		if (match == NULL)
> > +			return -EINVAL;
> > +		cs530x->devtype = (enum cs530x_type)match->data;
> 
> I think you open-coded device_get_match_data
> 
> 
> > +	} else {
> > +		const struct i2c_device_id *id =
> > +			i2c_match_id(cs530x_i2c_id, client);
> > +
> > +		cs530x->devtype = id->driver_data;
> > +	}
> 
> and for all of this there is a helper i2c_get_device_match_data.
> 
Ack

> > +	if (ret != 0) {
> > +		dev_err(dev, "Failed to request supplies: %d\n", ret);
> 
> return dev_err_probe()
Ack

> > +	if (ret != 0) {
> > +		dev_err(dev, "Failed to enable supplies: %d\n", ret);
> 
> return dev_err_probe()
Ack

> > +	if (IS_ERR(cs530x->reset_gpio)) {
> > +		dev_err(dev, "Reset gpio not available\n");
> 
> return dev_err_probe()
Ack

> > +
> > +	if (cs530x->reset_gpio) {
> > +		usleep_range(2000, 2100);
> > +		gpiod_set_value_cansleep(cs530x->reset_gpio, 1);
> 
> 1 is to keep device in reset? This looks like you are using logical
> values inverted.
Thanks.  The reset pin is active low. I will also change the dt binding
example to reflect that.

> > +
> > +	cs530x->dev_dai = devm_kmemdup(dev, &cs530x_dai,
> > +					sizeof(struct snd_soc_dai_driver),
> 
> sizeof(*)
> 
Ack

Regards,
Paul
