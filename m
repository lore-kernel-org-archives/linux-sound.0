Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961124F88C;
	Fri, 23 Aug 2024 07:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724399327; cv=none; b=YuUc4GZ2NlxzSxnwIHZ0eD/rxKnHoVFODRQvDMu9MQT0oBadW0w8dZC+5+E8Abs8IUg7PnQazaKxLPsinolw/40d69byU4hMnrrT1v2GHgw1tcyaa3+VmgaqKDJBmzx7+RVBzbT8V9ksSpeUe82YJ38Ti7cd7jmC+T/DDLeXCDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724399327; c=relaxed/simple;
	bh=noaE2FplxxgeRqPCON2ZhrH/Pl+HAROee1SjZ9Autn4=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NGk/4NBBQngGOoWu/ipnHrxnoaPRG3KC/eEwpoAfwz+GxmAL5hN2k4IIMpfGQyy43N1UkfMBkBNCLqR7C7eqi4XPcYNHtFQW8j4V1aPRB+MMXLANduJW7xmgmXjRsN6gZWkfeuzzUbInpQjFDa24+PQkfWrX9aE0h8aowhcxEMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hsa4GRJq; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hsa4GRJq"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 773821BF208;
	Fri, 23 Aug 2024 07:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724399317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LapZTA45jrsny6aQEB0O853tUVsDwyTIKGp6h2ZRsmw=;
	b=hsa4GRJqzkmSoAfYpr9/idSTC4hDbMJoNP13MyoIDYprxV+sPsNBZ7Bhk9xAMn6aXksr7w
	FD3Gdn86jIr67qLgIgxdPrcagmK7PRx7zCXmR5RHV9J5QGjwkGxb4x1LMQvWKJZH7wU0j2
	eO+nM3Ub9x1/3mkn0/sMol4T4KnY2YWpMz/o1rQiBlJbbY+R4XAuT1ruKL6Y7bSCS4hruQ
	F2kmcWL/ySG8oS/39FDgUewjtuSExbz9WFgO6tW4wtg4DEUiCIbocvT6S/iSvBsqvMnHnI
	91WUi6ZWTZogtmzyjU/d4A6TlTkcC5XhUJ2ABL+bv/0cp+v1J5Y82OH2n8sjUw==
Date: Fri, 23 Aug 2024 09:48:36 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RESEND 0/3] ASoC: dapm-graph: add component on/off and
 route names to graph
Message-ID: <20240823094836.63b3e49c@booty>
In-Reply-To: <20240823-dapm-graph-v1-0-989a47308c4c@bootlin.com>
References: <20240823-dapm-graph-v1-0-989a47308c4c@bootlin.com>
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

Hello,

On Fri, 23 Aug 2024 09:45:58 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> This small series adds some improvements to dapm-graph in order to produce
> a more correct and informative graph.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Resending this series because:

 * this series has been sent 2.5 months ago
 * there was no reply at all
 * AFAIK and according to MAINTAINERS there is no patchwork catching
   tools/sound/

So it looks like forgotten.

Rebased and tested on current master.

Initial thread:
https://lore.kernel.org/all/20240607-dapm-graph-v1-0-bb302970d055@bootlin.com/

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
