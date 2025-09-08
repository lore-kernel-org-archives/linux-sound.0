Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3068F2FB96F
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 12:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757333678; cv=none; b=DV6o7yFTVPO2eQh8deh91tbFuq06GiBnJAgn9CYXMuPMFWG9hrjHgiyYbEbypwKKo1rPzHvHQFBs28J/owJ2EANi+v0fYUKtvpP/2qJDJT/XCMELEYJ8j/D7x0tnIoFyQA64FZ9znZjYgrzvF11k1ToBvfQSStf7UkN4957Dvho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757333678; c=relaxed/simple;
	bh=DIrnZsIKuRCZWZdLzibquMJUJOqnu/JIyRnb4B8/QQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y+LPaLbK4yAJGGkvaSt9C52qsgCbJllfFGHA1yk2q3D5Cr4HQHAB9XEjpBx1LHT/RObUgAn5+Gjqp1VNdhkxzT+eHj8N/0wXpLsH8TvxTlXq9lcSdn1iiwlpfinljsY3Nw9rrkwrgx+Da9lKyDpsg5qkWjvTSWI1PW19I+SXryo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NJgPgIka; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NJgPgIka"
Message-ID: <efb5af23-c055-426a-bd7c-888f5983d868@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757333674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DIrnZsIKuRCZWZdLzibquMJUJOqnu/JIyRnb4B8/QQE=;
	b=NJgPgIka/mr4DTHIwPjlKp4ug1IIwj/wHGMcXqnSt2dpvZiaNKhhsVzQzNuCh2/K61AFfn
	pclyp3UxIGUlOgJwT7YwfTE7jHg1yLTYpf7V1ikdOm2Vp6E+RbzPjI7kJIXGjFZFu8fnZc
	LqvnEdqAwSiaCxHxcA2IgpNOx9ObBOQ=
Date: Mon, 8 Sep 2025 13:35:44 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 01/15] regmap: sdw-mbq: Don't assume the regmap device is
 the SoundWire slave
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
 <20250905143123.3038716-2-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250905143123.3038716-2-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 9/5/25 16:31, Charles Keepax wrote:
> Currently, the code assumes that the device that registered the
> MBQ register map is the actual SoundWire slave device. This works
> fine for all current users, however future SDCA devices will
> likely be implemented with the SoundWire slave as a parent device
> and separate child drivers with regmaps for each audio Function.

I thought you wanted a single regmap shared by all function drivers?
Maybe it's the wording that throws me off but are you now leaning to have multiple regmaps, one per child device/driver?

