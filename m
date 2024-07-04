Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3AF1A2C1E
	for <linux-sound@vger.kernel.org>; Thu,  4 Jul 2024 16:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720109207; cv=none; b=TmujxjOLR3CGKEk3nr5RMIXg4/xdMtop9T/QoEZz6UhyHiKkqfLfv55Ur9AV4ukBWw3JHXoo60oHbDMQ+xaDwO3ol+0XllKS+pPTpgyorKpsrARd+aas5jAFj+sdPJRwf2Z03TzHStqlloOKX8ApQN3YzrHEl7La7KSY7v/Z/LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720109207; c=relaxed/simple;
	bh=C3xrVJP8nDvJTWvh8CNuz3QpiTtaH7uM7tYaPD4yBFQ=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=YUK/MJ+t7tSgbsykKNxrIC3PbvGU9ZggpUPRr6vYbFQ6Pf/6liY8Luv5xoCi5OICGymahPK3TXTnj2Pg/VeUcUGQeKNY5nnNMDuAKRNxsdvSwIcK4J6c7wTp7FuP5p/uN5defBmSAvIjL/Va6NBlYw71oY7g2eoxs3VGA0cMWw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arunraghavan.net; spf=pass smtp.mailfrom=arunraghavan.net; dkim=pass (2048-bit key) header.d=arunraghavan.net header.i=@arunraghavan.net header.b=LkEaGemz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=h6Nd0kCW; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arunraghavan.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arunraghavan.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arunraghavan.net header.i=@arunraghavan.net header.b="LkEaGemz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="h6Nd0kCW"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 9D2F7114023A;
	Thu,  4 Jul 2024 12:06:43 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute5.internal (MEProxy); Thu, 04 Jul 2024 12:06:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	arunraghavan.net; h=cc:cc:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1720109203;
	 x=1720195603; bh=xegdhH9XaYdKcII4oVMrN39hvNIVmtXRbBL2vlFLAOQ=; b=
	LkEaGemzzcrdKAkUabNj1ynhQC5Dbic9AfNBlj+lqDAjd3zVgdIhK+w7RUynRpOp
	zGUlIN9Clrr+m1uoCNkOXgdxaYH2ZZnlYdXfnJ65txvSaz8Hgg5ltIG83EpMHuJX
	TK2LyqlpGrGnimAI6AORa0EsPIsybfZ3OxrN1pb9xtxz0jHsCO+668boXh2ic3NP
	rTmEWIVG0G3ZJgn1spViUROhvs42Vv60Ije1zpftWaiPZ2WLyXQpkOHPtn8CkPhR
	A9N4HMtpo4qGjaON9zsFNlFN1MqULDfqPpfAkVOi6m66TwTN7Y+vJNN78tTlYZD2
	eGQ9IMTngzCjjAqkKDIbag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720109203; x=1720195603; bh=xegdhH9XaYdKcII4oVMrN39hvNIV
	mtXRbBL2vlFLAOQ=; b=h6Nd0kCW2oSoeGPgw59EWY3qhTcPBlaTcoVX1doDMYoN
	hq8zaezqfjvy+Rr+LwWd4umans5lNVU2ZUUEde+ObMkiGSMLGG3Z3utTbu+BUZo1
	wPSMNfETRxH0+zprlHV7zRWzCJmJXIRP0j+SkMc/6BKe026qXdAxkHl48yhsjwqU
	FlHB+d43cQPsb4m+djvAb14lqtuQTLjjPokl7/dVMebYdxwPLCOTz63VSTK0WlUb
	RM+uqchoz3jkHyp3j9cp522eM7t8BBh6HqxpAb2DUYzng2kBBiDT3SlxJ5DO6Cjc
	NoaeOV4QaWYuImRFr7PgaRH5CALnAWaJxvjgYuCQWQ==
X-ME-Sender: <xms:ksiGZu8B9VLt0aySw8pkS1Octh0yaXltuRoCYJ_6xTs2ivj14Z5jjw>
    <xme:ksiGZuuoWMTO3v7ZYm-NTG3JVPBO39O2u2dcwtU7CbzskTrpAe2i1ZHoujGAfgESr
    N3kJmu4YDNQbkqlyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudelgdelhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhu
    nhcutfgrghhhrghvrghnfdcuoegrrhhunhesrghruhhnrhgrghhhrghvrghnrdhnvghtqe
    enucggtffrrghtthgvrhhnpeekhfdvueehleejhefgfeffudetheehteegfefgteeuvdel
    gfekgeegkeeujedtffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrrhhunhesrghruhhnrhgrghhhrghvrghnrdhnvght
X-ME-Proxy: <xmx:ksiGZkBmh7uiGKEnPqe6HOKrkRdcw96STrM78nARAZoi9JsSYqEvDg>
    <xmx:ksiGZmd1Z4ZYv2DCOe2pG-qdkccbtSRakAvCRgjpWWt1gYK65Yd5gA>
    <xmx:ksiGZjNLv_ZBp-wmenibBXbV2DPFwof8D0eoKhBzlFfO8RDrPjPnQw>
    <xmx:ksiGZglz7frXRDeo8U7hDrJ81sao_lUp3MuPjxIUS-JYvHiQYi1hJQ>
    <xmx:k8iGZvDA8iUm15T6Ni5lcWpyWTzlDpfYxkUou3-NN9KnekZFriKDgjpM>
Feedback-ID: i42c0435e:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 813DB2340080; Thu,  4 Jul 2024 12:06:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-566-g3812ddbbc-fm-20240627.001-g3812ddbb
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <d971252e-5342-4971-8f94-76b38182915b@app.fastmail.com>
In-Reply-To: <5e0a07da-c5d2-1209-0f26-d164f25a31f1@xwax.org>
References: <48beda37-1795-4d48-987d-1e2582cb3a18@asahilina.net>
 <5e0a07da-c5d2-1209-0f26-d164f25a31f1@xwax.org>
Date: Thu, 04 Jul 2024 12:06:22 -0400
From: "Arun Raghavan" <arun@arunraghavan.net>
To: "Mark Hills" <mark@xwax.org>, "Asahi Lina" <lina@asahilina.net>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 "Takashi Iwai" <tiwai@suse.com>, "Jaroslav Kysela" <perex@perex.cz>
Subject: Re: Handling complex matrix mixers in ALSA
Content-Type: text/plain

On Thu, 4 Jul 2024, at 4:55 AM, Mark Hills wrote:
[...]
>> I think for something like this you pretty much have to rely on 
>> device-specific tools to make the UX manageable
>
> For a full UX, perhaps. But the concept of a matrix mixer itself is 
> general enough.
>
> Perhaps there could be a UI tool which is self contained with one purpose, 
> to control a 'standard' matrix mixer. It could be invoked alongside 
> alsamixer or other mixer tool, and multiple times if there are multiple 
> matrix mixers on a piece of hardware.

If this were generalised, it might be possible for the functionality to be exposed via the audio server as well, which allows for things like sandboxing, etc. to work nicely too.

-- Arun
