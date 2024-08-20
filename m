Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C2F1B9B41;
	Tue, 20 Aug 2024 16:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724172258; cv=none; b=bMgZViuaXf+zohz8aDJbAJ3Zj8vZxSr2uzmdr5NIDPw1zA+vc7wRgGxXRHI9M65RTJ+ojaSTZMrnb5UQQwwWQB1j+F1HS3LwFfsHjiAjN4IbRL0x+AWWI66WnvknJJEkFhUNgcwI1V5oj5HXe8GFyOIXYK6YuJCTAp5oN1ezDts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724172258; c=relaxed/simple;
	bh=O1p9LvQGbtFvwMLibvEBtjINbWw270uIIfhcM7eBuCY=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jnfn0jtM+rpcdJKfdf767TuY6gd1aoOcg9oNyeTGzYGRt5cjBic4sNCCKizu6S4F9steX+EY0ValBFfp+L0tdOnLCitIrA7yj9h+x1/LQn4jHekOw2NeLc6MuR/HF/Wfw/NAHdRirX8UDnfw0BBX8xKW1Q21iDtXVY5gmYpW4Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iXg327zj; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iXg327zj"
Received: by mail.gandi.net (Postfix) with ESMTPSA id C64D36000B;
	Tue, 20 Aug 2024 16:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724172248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j9OoHq23PmUaSOSpacyNRfCHF/KEU3ZyZZHMK0w8D/0=;
	b=iXg327zjs7JVMT4dPtalpS42ZT+hjXK4STku+FH207yNyRKAabT6QDoKWPawgoSbcu2JLz
	1bI71B9sWpan0OPM2um4cLl8OOViR795sg/GhlKlDTXNUcoFrukEx/vjMHOnXebdXsdHt8
	rZ4SLNf4PkQztScEaRyqrLUv5tT0LNUtEsQWg07BrnPY70/F8Xt79WyHif2NuMsesJ6vgr
	Cb1OESY+36QG0yx/P9U7fdxqL2qOUCP2L9IPx1pV/539oORezdeIRu0W2cl/Iov/AimZFl
	w/PNxz34jJB1mSG8vvhYfPV8JfBmjCxxy3hn2toDE3ir/tPiHTsdDLVM0sUA+Q==
Date: Tue, 20 Aug 2024 18:44:06 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/3] ASoC: dapm-graph: add component on/off and route
 names to graph
Message-ID: <20240820184406.6ff2654e@booty>
In-Reply-To: <20240607-dapm-graph-v1-0-bb302970d055@bootlin.com>
References: <20240607-dapm-graph-v1-0-bb302970d055@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com

Hi Mark, All,

On Fri, 07 Jun 2024 09:41:50 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> This small series adds some improvements to dapm-graph in order to produce
> a more correct and informative graph.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Gentle ping about this series.

It applies and works fine on current master.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
