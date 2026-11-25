Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634953;
	b=FAox6dxf274m8rbfHfNqVlTQj/6FLQOgtuCRt4+qXKRBlZdvrM4N1B8GjdrdbZGGpdD/
	 3NUjaNQv50oWgORO0rUf+rOAqOdVR3tRCd6dMkSvjI/REbCBkRfsC3hIChNMplnXI+T69
	 ScNrxf/hCm81apiDLPIYsy4NRmtQyGIviQnC2Nm0xC8BvVwNL8P4vwGMAp4cmH0DzGm3n
	 1HCUqkOMYQRJ45Hj66LOU+n6QPc/JZb0kXZRK1R3kcsyLGtkyNdLqNOyN7SGTKuqrr1J8
	 a3+MuQcEx9FU+Z9ItV7qbCBdUiHizIm2xcwCLdSw+sUTxe6RZWevvEd1hguk4JSH6cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634953;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=3aUQR/uRNbfqhxE1+AnZcfzSuYfltsDA4horcMDLYeA=;
	b=QS7m6GN8kPwYOA1scYB2hR5pfV2KMExicRyzswmbuT0vtTvWHhHQi9DmQ2OpslteSyQq
	 K6l9brBy03XjpksvE9EebGjhUZrWE56m0DfB+B/teIEleEBllIvk0D0aQLifiOPBfkukO
	 LagmeC9deHEhYxwzzfWVSpxQJ/cRsWvckyCD8OFPpxgC2JkD5c83T7aiujLHmSZpFE56w
	 joXiB/v+yZ9YnXYTwV/ic/LkH2bldhbGb0nj9aFhAPOOLuTennFR0HKVth5q5eJxuXhnm
	 JWvnClD5ELt2T+AtzFS272VBmYuxBTcv6zCY1U48/Lz6Lu9h9N+xuX/S8YT0dtFjygw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=IyfCLVIj;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=xZJ2xvi+;
	arc=none smtp.remote-ip=202.12.124.157
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EC2606A326
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 19:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64EC2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=IyfCLVIj;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=xZJ2xvi+
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9EE2D7A055E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 14:29:12 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 25 Nov 2026 14:29:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1795634943;
	 x=1795721343; bh=3aUQR/uRNbfqhxE1+AnZcfzSuYfltsDA4horcMDLYeA=; b=
	IyfCLVIjgGqco5cGUjUrf4tGqaSAql+/EjK7HU68M600gX+Mj50aRzMgrIQ5DEtw
	9tUm5mzZl5FL1usxkEpjytrczb0UhjTH61BNOL3hYqxMSV4BJ0u2XqvX5GiJGZK3
	wm/Xwwe8E2cQ5Buu3lfDGv42aBv3xwRX0HYVv9vwA4vLZpgxOtIMDU/pSOF0JyEU
	BR9OBRnq6TBFKrv/DCDuLS5gexodZ2tcBdz+quhITgUIa7AjC39DgtMxbX57itRr
	c9qss2VLVjTS/WLo2AnZL+mWiOFb1VgxcwWuoR0/jFTdHG2Z/QzTGsMSlCpVFIq6
	wbbrCrWyw5HLEx0xLqteYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795634943; x=
	1795721343; bh=3aUQR/uRNbfqhxE1+AnZcfzSuYfltsDA4horcMDLYeA=; b=x
	ZJ2xvi+krDmdnejxxf/GBfA+ELvlDl0HnfGws6ApT9bfqdJY1dLd6RkOXfXIdTG1
	oPE3NyXEpi2shkTn0dETeim8vcO1zDcLjfDpDqI6u9+zq5FPwbKtCJ+nHr7Lm+zw
	KtTSSsM8NqxRITX0d0ztjwYo/sQXYnNalH9zEx3l3xuLjXdRxhbqNyWOwgF80Dmu
	yeWMVPceWEmZZOUWA7rOn8Q+CpN9giWp3F8sXqNr1XIylP6uInbvdZLxtd3huwb3
	NsYAYPRtXM3ciIdGvRjvIb8/njVnOEYYVh8sHc0Wlm3Z8mAfAsE669UmRdK1ATx2
	kATvMaCCyr10onE75S7eA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795634943; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:NmJCATsicys9nReJnqf/5aXk74OppHi7gtUKLW4MlTU4VpU
	Wq9BDHUxi43LIMbEaUh+upEXmJakdeg1WeRwsQt1x2e046zTRZxTJOCYglFbbUMB
	ftMKePIaYB7aiYt5m1es7FZAW/dHmELxcMkIkD0QlWoNyEc4jJqZFfnZ9wyPPXUF
	lq2ZCLxGYvhWTabkQ3weMSOOyU7C65hrBkWlQ4XzOtaROzj/cni5mipXtMfaJLss
	YbiVkwq82ZYMwOPqqglNhF9otiKUvtd5JP7kLE4Tt7srxN49lsWgKLe1NC1JxASF
	rzK6ZEb0+11cCx1PzjfmlRHFOnLwGj45NOTRXFw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:+QazOxuBjNsSvpq0AuEcRNLCXDw1PMj6pyc4LhmDGPE=:lyskuWo1LywLI5j6RdniwXvKPv431tjNWDjMqx6+P/g=;
X-ME-Sender: <xms:-TYHa5judzuN3YdIMSTG4lo7mexe-EWITSWVeXy1pQCGn7VMGYSQOQ>
    <xme:-TYHa436G7KHwsCadPi10ZqaRm1s1UW240Uuj0IefwsqMmtlVFNwtpunK-W7Itk0V
    itCAOR4vc_gxE0w1rz1pFJkluXem80gIO-DBSMa35at0aYVc8XEWXWP>
X-ME-Proxy-Cause: dmFkZTGTTsDBmXm93ARvO6jeLdx+oqEXK93SA0pHfRb7qRr42B83MNIxFMd4yoplTuItbX
    X/j5a314plhXFgpqfXc2/CkhwngTVylFEdGV8MOHeXfOv7BEJTglkE2DtRJn3ztY1ImMNb
    7GIpnZs1zrtbklfhrgyq0OraNDsQmzblAAkA93wBFl3JP2bdxPOcagCs4KBXNCaMyI6qgf
    mliLqnXe9bjVczJFJQEE01fDWSr80/3Jp7ohhxDGSVB2UDT/BUHlcz3zBhNEu1ZCaMvAYu
    FmKsIK11Qp/AGzyzrrRuTUKwYcFl5zAdgar2dyz/AW+2spHaSQsPX73e8/XmXEYaREFpGE
    ySXiwj9vX9Mng5Kqzyx6qLv6Gn//xIQJxG+NWB1EgS8ocdnmMb2RENFnnZ3AAIMYXuTdIo
    4y8U9UUjIvNZze6B3uJurvvtdz/n/lK2v68ou2kUcF2OUayyuhKh1IsmoFv989zA5UExC1
    cowJFCsB0SqGNnRRJOPHkgMqUMFpRUEL0sk9/j3f1RCdzingNuVhKYja9PVJoeSjlJsgCq
    Uy5w3LzsZsRvesgljYNabf4/FJAngP9i/U4fOjTKJA8FwoRabnmqMYUOpaHPWd7GuCnqRt
    W8YTARC81CubSoJt3p3vAR/wpHq69Mv0guKXNzi2AuWTkA1NWuiZM57KQhvw
X-ME-Proxy: <xmx:_DYHayr8uwcF57WeHOipMEfBlek0ujdXkd6UNnKRnrFTJfhYsq5oLw>
    <xmx:_DYHa_kee6YbnBnxQ9j2ohPoPZ0b7zgbXnVL77z9otANea3uPjXa_A>
    <xmx:_DYHazRZdi9WEIJh3qV9ZtHa7KlIecDWFYT_8sCKUwonJ_HsNPpVBA>
    <xmx:_DYHa1YjXD7ce_GxZs86bDpCeABTs0DfiRPLNxOEGsdyEVpZj4wGOQ>
    <xmx:_zYHa8AeLaUwq02vADZr9aoP7Ud04qijkj-B8BwekgQHcjMh-XB0AaDy>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 873A632A009E; Wed, 25 Nov 2026 14:28:57 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AEfgzeNhvdo3
Date: Wed, 25 Nov 2026 20:28:37 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jude Gyimah" <jude.gyimah87@gmail.com>, lgirdwood@gmail.com,
 "Peter Ujfalusi" <peter.ujfalusi@linux.intel.com>,
 "Bard Liao" <yung-chuan.liao@linux.intel.com>,
 "Daniel Baluta" <daniel.baluta@nxp.com>,
 "Kai Vehmanen" <kai.vehmanen@linux.intel.com>,
 "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>,
 "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 tiwai@suse.com, sound-open-firmware@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <c8c7c888-4b9c-490d-afd5-0b49ae98b5cf@app.fastmail.com>
In-Reply-To: <20261125183706.53331-1-jude.gyimah87@gmail.com>
References: <20261125183706.53331-1-jude.gyimah87@gmail.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: fix link failure with
 SND_INTEL_DSP_CONFIG=m
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Nov 25, 2026, at 19:37, Jude Gyimah wrote:
>  }
> 
> -#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_INTEL_NHLT)
> +#if IS_ENABLED(CONFIG_ACPI) && 
> IS_REACHABLE(CONFIG_SND_INTEL_DSP_CONFIG)
>  static int snd_sof_get_hw_config_params(struct snd_sof_dev *sdev, 
> struct snd_sof_dai *dai,

IS_REACHABLE() is practically always a mistake, don't do that.

There is surely a way to correctly express the dependencies and avoid
the configuration that leads to this.

     Arnd
