Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FB91CD15;
	Sun, 16 Nov 2025 03:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763265146; cv=none; b=PJyadjJigU9eFeQCRWUqMzrlzLKWJdnFlCb72DwgP+dN+dyDdUgP6IrzavYNhGsbv1xmQnFQaBr0mzDAt6PZap7vFSzXl+CqdomswoHG46kV+s7vL2XSBE+OdqJP7kmvve3fv9K92Qw02Dt7XTar09QRKiTf23+/ALvF57oH1QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763265146; c=relaxed/simple;
	bh=1+e/wIax49sBSPML2fl2yRdu21pXMvVd6ONyljLK7jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZrK5725otjeqltveuc/QT1JKvUtY7iWTevDYRty/wbPcDeYamDP8YVvv8/C3OKx7DJj8WSn0VcLG9B7EEqSbPysBiBAqb13NhEcfwFYvws8ayxpYD5LsLj+XrziDqHLwDP2kx0fHhdV0MMNOIxSSP8GS2amRkEhakrF0/IgZ/X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=fSwfVd6n; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="fSwfVd6n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=95kFSsLKyE4ALNC5FIjf+7ESIXBQpMSorE7EunEryYI=;
	b=fSwfVd6notXp0m5r0Dq8cVrJOOuYLd6b2UJZuvYz5mnJGxTELZm0MvmdjRAhv+
	tSxORf1Qcx/0zNLFrlLusMJMG3sChZJsnf9hlvtOE9dNhdwm+cQ+MPykuBC/JcYe
	cqGfqv/oL5Ox3jc7XmZG65g8VjnvHDbp26btXRsV7I3DI=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDndQ2kSRlp1YYSAg--.50067S3;
	Sun, 16 Nov 2025 11:48:55 +0800 (CST)
Date: Sun, 16 Nov 2025 11:48:52 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, l.stach@pengutronix.de,
	shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 6/7] arm64: dts: imx8mp: Add hdmi parallel audio
 interface node
Message-ID: <aRlJpAUV9nfl2Afv@dragon>
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
 <20250923053001.2678596-7-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923053001.2678596-7-shengjiu.wang@nxp.com>
X-CM-TRANSID:M88vCgDndQ2kSRlp1YYSAg--.50067S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUeXo7DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiOAccgWkZSafRNQAA3Y

On Tue, Sep 23, 2025 at 01:30:00PM +0800, Shengjiu Wang wrote:
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
> Audio Subsystem to the HDMI TX Controller.
> 
> Shrink register map size of hdmi_pvi to avoid overlapped hdmi_pai device.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!

