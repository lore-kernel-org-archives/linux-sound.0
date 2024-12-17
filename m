Received: from omr008.pc5.atmailcloud.com (omr008.pc5.atmailcloud.com [103.150.252.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF7B1EF097
	for <linux-sound@vger.kernel.org>; Tue, 17 Dec 2024 13:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734440825; cv=none; b=SU5z8fzAohmLwB+S8LZxp7YpWmpRDRGreAuNE69I1uKaU6S7kCfS2JRHwj7qEuWpDpW7MlC0be5EbrOeQB0hnPi68eKV3FUd+paeE+0Zsvs37fgyTKF40J1WxAnhRKDNIbGEhBfx4BY9gJB50UZlNveYKvQI2IjMK9zWM7KsfXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734440825; c=relaxed/simple;
	bh=7npDhfaeR4/b82Sa/vZhhIYsMb4TLXvfQSQTwdfyk5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uahegWIZ5/omHpukWO69JwUC0rrf5VnymF107emMjkMA26YEcxrOtgyJdjfFJslya3oQjxc507De3ATRtspcU0V1gv0jSRlc/wdL2737uW4/Lxu7+vfeCeoePNYDfrEvDqsPLpspU/CYPA6w1oNeJuhr+w+Rl0KRUupANz6Blaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au; spf=pass smtp.mailfrom=iinet.net.au; dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b=uPHpKlJy; arc=none smtp.client-ip=103.150.252.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b="uPHpKlJy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iinet.net.au; s=202309; h=Content-Type:MIME-Version:Message-ID:Subject:To:
	From:Date; bh=aQq+WpRDl+QSuSjL9NZvuqk6zr5VIWauEzIfqf+CxKI=; b=uPHpKlJyICvJ0aL
	qksX9/B7b3fs9/Vcu+KlGYAXk3PpcePrPiwwVSmEUd56uyoEUyWlX/DbnnILthVyB4g+3OYb+rf4L
	Hp/N8aXE1eAfbGY1Q8hlTGDvbbCzU56BsP4LNxMlW9+BlOaR0ceELkxnlv9shCoo0dfYdsmaMRDNg
	g7Fu4sJi5QXJepZyNrI5TkEiSKd5l8hfbT2+SjP2PCIMRgRV5UIDiMyQzsZjn+8Z96WidHjcBJHVz
	q6FJL3WaMmdCjDYGJJc/NRMFfaSyLvR9nmeuy0h7wZ0Vvus8wMmzxAum5SyKZmI10v5fmxIs225MM
	9H72qielLjt4tkG8sNw==;
Received: from cmr-kakadu03.internal.pc5.atmailcloud.com (cmr-kakadu03.internal.pc5.atmailcloud.com [192.168.1.5]) 
	by omr.internal.pc5.atmailcloud.com (Exim/cmr-kakadu03.i-041e245383aa0379b) with ESMTPS
	(envelope-from <gordoste@iinet.net.au>)
	id 1tNXHq-000000008W4-02U1 ;
	Tue, 17 Dec 2024 13:06:54 +0000
Received: from [220.233.184.101] (helo=rpi5)
	 by CMR-KAKADU03.i-041e245383aa0379b with esmtpa
	(envelope-from <gordoste@iinet.net.au>)
	id 1tNXHp-000000006Z3-2VII;
	Tue, 17 Dec 2024 13:06:53 +0000
Date: Wed, 18 Dec 2024 00:06:52 +1100
From: Stephen Gordon <gordoste@iinet.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 6/6] ASoC: audio-graph-card2: Use extra format on each
 DAI
Message-ID: <20241218000652.197e8b7a@rpi5>
In-Reply-To: <87v7vjm639.wl-kuninori.morimoto.gx@renesas.com>
References: <8734innkpy.wl-kuninori.morimoto.gx@renesas.com>
	<87v7vjm639.wl-kuninori.morimoto.gx@renesas.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Atmail-Id: gordoste@iinet.net.au
X-atmailcloud-spam-action: no action
X-Cm-Analysis: v=2.4 cv=cLjmsEeN c=1 sm=1 tr=0 ts=6761776d a=HSUqTxjWRdnMbJspRni59w==:117 a=HSUqTxjWRdnMbJspRni59w==:17 a=kj9zAlcOel0A:10 a=RZcAm9yDv7YA:10 a=x7bEGLp0ZPQA:10 a=VwQbUJbxAAAA:8 a=yC-0_ovQAAAA:8 a=8UIr3vucC3dvTkvS2oIA:9 a=CjuIK1q_8ugA:10
X-Cm-Envelope: MS4xfETo1HNkHxAe2ibtQI+PZdbS7sFVCoSSNc/QtEe+r2enVKRU59NoS82YFrOb/LKk5dubhPB/IcHPJywQ64Yzyv3QDyOrqTGXyTCVchCxyIQrWPNgqFbm G9qOii8kSBtZ4g8/vhfOx1pxxQFvI3pBxMiXliHiEHjpqe4CQIyxk+zJ3T55KWOdeVqEm7zmPq3FQ8bcjVXClqS6k7g9WOrp4hU=
X-atmailcloud-route: unknown


On Tue, 17 Dec 2024 01:49:30 +0000
Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Current ASoC is using dai_link->dai_fmt to set DAI format for both
> CPU/Codec. But because it is using same settings, and
> SND_SOC_DAIFMT_CLOCK_PROVIDER is flipped for CPU, we can't set both
> CPU/Codec as clock consumer, for example.
> 

Hi Morimoto-san,

This patch (#6 of the set) was generated against a tree which didn't
have the port_cpu -> port_codec correction applied
(687630aa582acf674120c87350beb01d836c837c) and it fails when applied
against HEAD of
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/

Not sure if this is a problem...

Stephen




