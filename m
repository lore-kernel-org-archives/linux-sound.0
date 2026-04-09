Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA42E39A068;
	Thu,  9 Apr 2026 22:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775775279; cv=none; b=Z3CxD3mUepIVbBFVJjKEJSRj2301gQ/xukXvGSlnKCL7UGCVCFMCI3QeoIVldQtn9NHZZrQj4Dhd+j51KMp34BMCeb2YGPolpoIFxXs7MlnrV6uLUuFWaakEnd/3yZtcFY7vDoRhwnnEYCzJF93IlCxXphC6Wp9KlEzQXZKuRx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775775279; c=relaxed/simple;
	bh=cQFpxUhEJ1v+39UvQCCeuLgf6mineGEYx3LTEmiS9a8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L0bSZk+qwV+6EXny6rJLQ6YRIOoQi1S4nVW7pIaGGDf29sskHjzv8V+7ikCX6NvvcWB1Ka2xb95Sd2szGBPjL0b2OYedzmny7qXzTtG6DAbYSW8FyUxgYhpfIYSVRNt3GKb2/g/6GH9K/+BHgenZdzkzbl0pXkBsX69C+JOXx+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=NVjgGfJA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nDpZWiFr; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="NVjgGfJA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nDpZWiFr"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id DBAF0EC0429;
	Thu,  9 Apr 2026 18:54:35 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 09 Apr 2026 18:54:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1775775275; x=
	1775861675; bh=7fp28mcMb0mnwT4yTzFG/beFz3/gzHRdObQr/qkA+WQ=; b=N
	VjgGfJArtwaENKwRVR8FvDSa47bxeZasr+fv01VbKyMcCAvXlQ4XPHc77M2xILSh
	J+rm1r9hHnQrBRegHZXUSKHDg92iNu2lNu+GofjuYCcuXmJHk0+hSeFhyhVrhPOX
	FRSI/JMs/7QwLdCCcaKvmOUPy8x0eEp0qw7N7WsN3U0T810SEtYvB9nYXDsnDXZH
	gKc9oXavAQDEWOtlCJvri/RiMmG3nKVi+kW9U8P+KILgugSRbrXOWxJIohyHX1Ui
	RuLRTU8wY0jO49fBNBUzLzAYpHoOa9khPIIXpW1OcZQANXjCZXVOq5PWOqGewLFB
	vwV0djJdwUF4xw8XH0VeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775775275; x=1775861675; bh=7fp28mcMb0mnwT4yTzFG/beFz3/gzHRdObQ
	r/qkA+WQ=; b=nDpZWiFrXWIDGg8R3V6tGrlN4/43aAXs4M+P1KyuafjS8DMQqMa
	mUo6ofC+scWbfl+IesSzw482nmGQtt9XwAxl8FoSSM7YD8r2Oz+Jjz1F3T3DvT88
	LU+wX6MDIbLuD38KfMWqDhzqYmxfiqZ0ng4VO9KGfcu/jO+LFVthDgO2NNjx6i8s
	vD7CnD06KTr9SrgaRdLQnTWBSDzkD8b/lUuK/zRb2d2k0zUBmi8GiPVK7jQ6v1p3
	g4VXwzMA3hUf0igROuD925Ceq2DTTBvYcn7Ms7Dl9650Kve8oP2q7vzu3Cktf+dN
	pd5OX0iNaZtxmI+WaBeuxo/udTKKT/0uYdQ==
X-ME-Sender: <xms:Ky7YaZJ2TV2AvCJGdfzua_7wFTC2AR1rO8SksqxehaA4-V4edrNcpg>
    <xme:Ky7YaecXCCG2TNq6hzjbt-k16E524dDGlGdJ5K3bsbl9XqTZIuu63NibLNii1zLY7
    b9YYjuJAKiEdmQKd1BzBlgPrWIZX6MCeMRJJTgP3-x5V0mxp-brQd4>
X-ME-Received: <xmr:Ky7YaY-GVRcmEngoyLXdJtS_2RedbyLAHx65AQk1szedD-56QFpRG6nNMF1yF5Q48okdp8iGclisbwqTakrEi3XodLyC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvjeejhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghshhhi
    ucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqe
    enucggtffrrghtthgvrhhnpeehhffhteetgfekvdeiueffveevueeftdelhfejieeitedv
    leeftdfgfeeuudekueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhppdhnsggprhgt
    phhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehgrhgvghhkhheslh
    hinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsohhu
    nhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrh
    hnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvrhgvgiesphgv
    rhgvgidrtgiipdhrtghpthhtohepthhifigrihesshhushgvrdgtohhmpdhrtghpthhtoh
    epshhtrggslhgvsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Ky7YabrjUmPivbbR41EYfybvit3BAxcQ9Uihzq4uq4eu_nH8ryZJpA>
    <xmx:Ky7YadCIZAz54Of4bGIP6UFmTbFzN4ZkSV9hP7wJmGZIyAHFSqNfSw>
    <xmx:Ky7YadwkRxiXxtmHbmj466DU1h_FC3oKQfRdLfRC-WFZBXq54y7bwg>
    <xmx:Ky7Yaa01fO8ZUNkjTxS8wYemIk6TErwJYmxDU423B-HEd2lvEo_3_A>
    <xmx:Ky7YaePhgBWcKVSJ5tad57UFCOVcxLxPZFWBiGupf7BjGDwPibRY7DUZ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Apr 2026 18:54:33 -0400 (EDT)
Date: Fri, 10 Apr 2026 07:54:31 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	stable <stable@kernel.org>
Subject: Re: [PATCH] ALSA: fireworks: bound device-supplied status before
 string array lookup
Message-ID: <20260409225431.GA1084385@sakamocchi.jp>
Mail-Followup-To: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	stable <stable@kernel.org>
References: <2026040953-astute-camera-1aa1@gregkh>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026040953-astute-camera-1aa1@gregkh>

Hi,

On Thu, Apr 09, 2026 at 04:05:54PM +0200, Greg Kroah-Hartman wrote:
> The status field in an EFW response is a 32-bit value supplied by the
> firewire device.  efr_status_names[] has 17 entries so a status value
> outside that range goes off into the weeds when looking at the %s value.
> 
> Even worse, the status could return EFR_STATUS_INCOMPLETE which is
> 0x80000000, and is obviously not in that array of potential strings.
> 
> Fix this up by properly bounding the index against the array size and
> printing "unknown" if it's not recognized.
> 
> Cc: Clemens Ladisch <clemens@ladisch.de>
> Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Fixes: bde8a8f23bbe ("ALSA: fireworks: Add transaction and some commands")
> Cc: stable <stable@kernel.org>
> Assisted-by: gregkh_clanker_t1000
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  sound/firewire/fireworks/fireworks_command.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Good catch.

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>


Thanks

Takashi Sakamoto
