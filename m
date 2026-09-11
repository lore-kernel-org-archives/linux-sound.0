Received: from r3-47.sinamail.sina.com.cn (r3-47.sinamail.sina.com.cn [202.108.3.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D353F3DEFFE
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 02:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789094415; cv=none; b=lQDOPHWIzrkp7ATpRyT9oqzLf8/yXoQL5Cg9oJ1MQGs6QC0ppOVpY0JfHUTbaRgRLMrqUcfCzteEJWOGly8xI+fF9cuULEM7xu4E/o+KH3mDKh7fnx55Lsm+LxAfGCkeNN+O7bVsPtgxV27nb/30WbroA2EuP6SrUR1uPhtcoQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789094415; c=relaxed/simple;
	bh=WqdSGS1srF/GGxajzNh4AZpq7krQiZd3Nlb+3je7cQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=fnyFjoi+b4H0PO93FiXBmnTYtOSZbgH/MJtNvGy/9w4FWB1NRHFlzEsEITpuoNoavyt8ukhAVFeKViS+oJedmzZY7Ogt+8JbkrsbrJ5GzspShEdoFJyDSrT2jcAiRYbFsdumy5wkHCScWfSm7vl/NA3BJtrxf2TedR0rdly1aoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.39) with ESMTP
	id 6AA364F500007CF3; Fri, 11 Sep 2026 10:18:30 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 1F02533ACD954FFEBA654E1CED5E974F
X-SMAIL-UIID: 1F02533ACD954FFEBA654E1CED5E974F-20260911-101830
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: RE: [PATCH 2/2] ASoC: codecs: ES8326: Adjust the standby configuration
Date: Fri, 11 Sep 2026 10:18:27 +0800
Message-Id: <20260911021827.29963-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <e008bc53-559e-44b1-ba0d-4dec50cc9336@sirena.org.uk>
References: <e008bc53-559e-44b1-ba0d-4dec50cc9336@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

> > @@ -1078,14 +1079,19 @@ static void es8326_jack_detect_handler(struct work_struct *work)
> >  					SND_JACK_HEADPHONE, SND_JACK_HEADSET);
> >  		} else {
> >  			dev_dbg(comp->dev, "Headset detected\n");
> > -			snd_soc_jack_report(es8326->jack,
> > -					SND_JACK_HEADSET, SND_JACK_HEADSET);
> 
> This report removal isn't explained in the changelog, and I'm not seeing what replaces it?

Sorry, I made a mistake.I shouldn't have deleted the report here. I'll fix this in the next patch.
