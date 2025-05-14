Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC78274653
	for <linux-sound@vger.kernel.org>; Wed, 14 May 2025 12:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747226399; cv=none; b=C0DvCs4SjE5RO7YhhVoWcJqX7357mRaEzR/ANDWOjdxgbRjR9bL6VSvJ+0eJGSI/dCFt8IVJDysj/zbkM/GM3+6/1Z/aAUt8TPzjo72QDBB8ICBiEJKfrmtOuECDe3RL1FwQ5qa8tkZDKKq51w2ivZ60mg9TQN31L21p+IHH8p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747226399; c=relaxed/simple;
	bh=eSbP3fs64SU/s+BPL/fxIjSWZv0JtL1XRKX4thm4eQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UWKyFLWNadYlGti0EXywJoNED+CYt+5g2oJyl6cR/m2852aICNE+RQ8N/BfH9kgr68A7902NCLGLJ6GBQZdz8+eJ/6tpjIKAWkf0S+wmRaC7+vS88qXzeq/D6BJqHVMDW9wokLuzj10OlYTVdmvevU9+pBBizyJ+A6x+mt6d074=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=p2cRB75L; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="p2cRB75L"
Message-ID: <2241a45d-e63e-4640-bc0f-c6f4537740a1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747226395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=12WL5j4bEDA6+aUlWqmLZExEArPXz33fSukkb5ZpVJQ=;
	b=p2cRB75LhbtWIDKQsnDEWarvw0/ReVSm2HsRNKCsg3RghWt8PgxqoaggmExij9Zh3zA1pL
	0wUOzls4eIhBX0LjmMgky9Vt9cxHZBtE+pUgpcCW9aQZYF1Fmn7f48aGp58XJQY45XvgK7
	zy8ZMEdDWWw/iQ2RW6Ss0uuB584yfuo=
Date: Wed, 14 May 2025 14:38:11 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 6/6] ASoC: SDCA: Create DAI drivers from DisCo
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
 <20250512124240.799509-7-ckeepax@opensource.cirrus.com>
 <8f94874e-0a4c-4c52-af12-c3e67e45cd18@linux.dev>
 <aCIs30Zr0uXRt6cs@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aCIs30Zr0uXRt6cs@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/12/25 19:16, Charles Keepax wrote:
> On Mon, May 12, 2025 at 04:00:18PM +0200, Pierre-Louis Bossart wrote:
>>> +		switch (entity->type) {
>>> +		case SDCA_ENTITY_TYPE_IT:
>>> +			stream = &dais[j].playback;
>>> +			stream_suffix = "Playback";
>>> +			break;
>>> +		case SDCA_ENTITY_TYPE_OT:
>>> +			stream = &dais[j].capture;
>>> +			stream_suffix = "Capture";
>>> +			break;
>>> +		default:
>>> +			continue;
>>> +		}
>>> +
>>> +		if (!entity->iot.is_dataport)
>>> +			continue;
>>
>> should this be moved as the first test in the for() loop? The switch
>> cases for IT/OT only makes sense for streaming/dataport terminals, no?
> 
> Can't be first in the loop since the entities can be different
> types and the iot is part of a union so it is only safe to access
> is_dataport once you know it is a terminal entity.

ok, it's be nice to add a comment for the rest of us who don't remember the low-level details of the data structures :-)
