Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56E4356748
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 17:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779297430; cv=none; b=V3KW7rcl24UTEMa7Dxo/GqYZXkh2L2h4uzP9YCRBhIlpdYhMMab9AquQgbNVoCjHfhsfiufCMWQnpMZhQa0GSiq9TkIr30DB+VCtYyqFLR3q7vDnrtFg9lK7AtDsrdDL9krUKBcH1ypOXxkgLA1Nc/mrimCP3G2H0fycJA0M9Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779297430; c=relaxed/simple;
	bh=4mJaI5B1wx8D3DlL+WWrh/2fIPbh9MGbuKGaxXHc4Zw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q6GvhPej5TaD3Khtp2JbTekI4vEDt2eyJMefnJaSF9Qi6azcj7MrsMcP8BQZo/39n0PMhFuaw7ugocVu1EKBvD8AlsrYnOwDGr3186PUVWn5BO0oKhbCZYTWmcv3NkpljOgxjorii74u3Td0ta0cuPY/3knmBgEViHf6TM+CIbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dIcD5hB7; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dIcD5hB7"
Message-ID: <be5dd478-d520-4e7e-a0e2-946b128ec4f2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779297425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cObcc684uQxv5LityGsl6kdo/VFYJI6VTRJMUnVnoLo=;
	b=dIcD5hB78ljZkPuJBK0olxz3chPkjQsxhfgemgwLQMaPK5AEME/ncGnyUS+rlg9addqflw
	I1s4OsHQbcUz3wZsqE8V8Drl/+JMx5i3bUqWZ1nXH3TPoDM6DAWNQBUOjjsz7NMo3036e/
	aS8Uv+TNP2ralJlsFd+AeT4Z+cVwUZI=
Date: Wed, 20 May 2026 19:16:55 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] soundwire: dmi-quirks: Disable ghost Realtek devices
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org,
 vkoul@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, oder_chiou@realtek.com, jack.yu@realtek.com,
 shumingf@realtek.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20260520163631.3300102-1-ckeepax@opensource.cirrus.com>
 <20260520163631.3300102-4-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260520163631.3300102-4-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/20/26 18:36, Charles Keepax wrote:
> Many systems ship with a Realtek audio codec in the ACPI that doesn't
> physically exist in the system. This confuses the newer function
> topology system that creates the soundcard, as it builds the card based
> on the ACPI information.
> 
> Whilst we are working with the laptop vendors to try and stop this
> happening there are quite a few systems where this has shipped. Add a
> quirk to disable this "ghost" device.
> 
> Currently this patch should cover:
>  - Asus UX5406AA
>  - Lenovo Yoga Pro 9i (83SF)
>  - Lenovo Yoga Slim 7 Ultra (83QK)

if this broken ACPI stuff works for Windows then it'll be an uphill battle...

Could we filter instead those 'ghost' devices if they fail to appear in the new ACPI table that describes all the endpoints and card topology?
