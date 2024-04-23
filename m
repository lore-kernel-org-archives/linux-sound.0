Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D55947A79
	for <linux-sound@vger.kernel.org>; Tue, 23 Apr 2024 07:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713856915; cv=none; b=QL+0iS5LEAIQ79vKWIrV41BcCBKzZS4aLFTs7uXbAAm6U7Bqick62n8mx4DZ9uQ3zynlPa34gdl6SPL2EEBDR3IsxtoSNcL92kfLl6LUxK/vHGZCq2hO6eCxnjx35L4uqTvySxLxXr7h1NfZD3Y7pJcJrdAB6ottT8+VpWCPKdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713856915; c=relaxed/simple;
	bh=y0ao0/8y5we1tg4My1Rn+Bsvc4oux0OPwno86l+JOu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VEiXH3x8N0kZH3dnwFG8+kDT34iJV2SMVomDswx/ukMkxJnccAUp+MAaVLjk3/4mzjmwBO+/O9x83B3wS9MSvV52h2jgZ+25fRKyQwxoHK3INq18v4gOpBiHcz9NmF8dedGpkj3XFgMsF6ImBCNZV0Qi6QXEFbsw3YWzPPAtdAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b=oTO2VgrL; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b="oTO2VgrL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1713856903; x=1714461703;
	i=oswald.buddenhagen@gmx.de;
	bh=g6pQJTrGcSLJ5Un9QP/s1f/lSE1w0ra8uusiU6JiQ1Q=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=oTO2VgrLnupqgZ1HPMpTyyFpj08MVC5fYnkcgh6W7IEfoZieEmSsfpU8VMzzwEPC
	 kxECghpWfp/9Ng5h5rZ91KsQ/OILWeQfcIhDyxzU22gtlqNNOvqNlwZL69w3aKGo3
	 b6XwlW+juBKouU6ILlCs9oSmh3nYI8kW3DoBabXXGY6prBzh8cSyt/e6YHoIx6q6t
	 U9rJb0wpDxu3QH856Or7NvCnA07Yz4QsD9hx5nYT2yquQm/GUOnUHdlt/t/KkoclB
	 g3t6D+IPH5WAK6+58uiLyI7INK8xkETpKgDGw7TyM3RRwG50bZt2F7KwwWm/2i7Wu
	 CiLGF+mJsXwao6sy7A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.109]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MHGCu-1rukdT36LQ-00DJr1; Tue, 23
 Apr 2024 09:21:43 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rzATH-6Pd-00; Tue, 23 Apr 2024 09:21:43 +0200
Date: Tue, 23 Apr 2024 09:21:43 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	Pietro Caruso <pietrocaruso50@gmail.com>
Subject: Re: [PATCH 00/10] ALSA: emu10k1: fixes related to uploading firmware
 to the E-MU dock
Message-ID: <Zidhh8XJwUr6Y2kh@ugly>
References: <20240421204707.2487686-1-oswald.buddenhagen@gmx.de>
 <871q6xjiw8.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <871q6xjiw8.wl-tiwai@suse.de>
X-Provags-ID: V03:K1:E/OVUP2zfrpopNeu1OJc8mSGOvLOwKzg/XJb+bKQCZ+u8Z0snsF
 llNjp98iHiFb53sCpeAAbW/0khltGStpcsGhofd2x26RDm3Pi5fp6G5NZG7/X0flhHy1MHC
 tvkuYxQ7m/u+rQFNfp16kMQks2858wo58wem4GpeZECErkALNn3kjyxnoPC3yn87OU30NDV
 TySWfHKkysx9OAzRjc+Zg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:E7Y5VxXga2c=;2Y9gHjv2NvyiFYn2wRmXn58itFx
 P9ZqxVOCasyiqqJJyVliE5TiP7IMMdXb4LgqkhAd7JkmwassVTuZmDUKP2jQV9NgPONpkXKDT
 /1zljdpDxx8DVD6y3ExQrd+CRqd1Z0IFQQcPwj63mNd8tUwlwMi3QMhDu9gIiSkskg/rwy33u
 LbxTDSj8NkNQoN+KsKaWgI2Z69ysRtOn0hi7UVlF5zXr40jUUbEBYVHZi8Zd0sJ8EZESJf4mM
 KkVsSp+kq/qCO1mlm5UFtN5eErG0KLkCT/ga71+6Z8asGiR99z6IQGjDfosrITpxjTWXI1HLH
 l+WVcl7ctWG1kuhMavCNgXfDBvMagyxU/eCAaLYya9+hO/s+7Vo6dYal3nXBrIumlZMNCDYpQ
 +IvRpG5/MjqaUxA0f1BODPKFP2l5s40uCr2/ImGrDxjWV6JALSNT15jV3g6C3WPdVoZIbB1RV
 0eZm52trviKJWx+CAy8GBEZ43zFAXfWbsqol28KN5Lvddof7KuMH9NtyccnylNCDSPgBZoRCE
 Ct/1l6zxyiD4jcdwWhHl2jMSXsv4mmaS+5eKJhCQWTVpbpTZuvl7cLM0VhB8ckqpkfryipXa3
 uxzjUD8B7W3rKiCpnzMcdjd1qk24m2g+z1HqeQdCamrf4TwiqOK6xax8UKkia/VhX/EtUE66y
 iplMGyhEbQZY3C1eWXvmVpG1imAmqGlMPe7d7/d41AekqYIazWgYk4U7sPws4rlYSegZWPSq0
 Zx0IBswi1iYejbTKgDhKWl8eDiqWkIJ+NT1+oYM5m4Luc6aa24hvWX+i32+fDL7RMWlCZxNCy
 o1qmTFQyfYhrOQhrT9WC5NOrSkJz5Rczi71SqvC/O6QuQ=
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024 at 09:29:27PM +0200, Takashi Iwai wrote:
>On Sun, 21 Apr 2024 22:46:57 +0200,
>Oswald Buddenhagen wrote:
>>
>> patches 1-3 & 5 fix the regression(s), patch 4 fixes a related pre-exis=
ting
>> problem, while patches 6-10 are "only" improvements.
>>
>If a few of the series are rather regression fixes that should be
>merged to Linus tree sooner, please separate them and send two patch
>sets instead.
>
i can't give more precise instructions than above; it's a judgment call
whether you consider patch 4 urgent enough (it's a fix, but not for a
recently introduced regression; nonetheless, i've seen less important
patches from me be picked to stable). i'd just split the series in half.

>I don't see Fixes tag in the patch 2, for example, so
>I'm not sure whether I should pick up.
>
as the commit message says, it's preparatory refactoring for patch 3, so
it's not a fix, but a mandatory dependency for one.

>Also, your Fixes tag usage is incorrect.  It should be
>  Fixes: $ID ("subject...")
>while yours missing the quotes.  Some people are picky about those
>formats, so let's be strict.
>
fair enough.
