Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9104D270EAD
	for <linux-sound@vger.kernel.org>; Wed, 14 May 2025 12:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747226398; cv=none; b=VtmonrGQUXcbGZlOsKFJ9b46CN9gHPgz5/ge4+MQAHtyZR4Z7iGR4kJpjYcZvjbm0NN76jckG/Eq+qlbguYEj3/NciiOmBeLHxdGpKKfhJZfUiIvHsvR9CBw10e0pJFtpq3mlaCbDubQdvQklVk3qOUa6Be/XMYBjt5Oomz9P44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747226398; c=relaxed/simple;
	bh=2bHfixIrfp1fzUnly4gm7qoipzXCaEk3R4k/7UtIkps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u1aHH9wkhjsjgTmODisJ0ZvGa49KGdlhmf9is2T6b9zJR5iyQqEw1mP7IkePh9Z+iDX4HTl3E1PIjUmFsW4v84nFfCI6PfmWWZBRBfNIvALd4D/hGn5uKE/J6vDN1e516HpxuPPRD9lYvIbMNNPuh8qWFai2txB2cFU5QbNb64U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fkwGCyiK; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fkwGCyiK"
Message-ID: <ac2ff52d-1338-4bb3-b9e0-3a7e28c3baf6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747226394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zyBxK4rp6rY/NIWik0Gtt2wdeBstFeJvZv6w1dVZ1d4=;
	b=fkwGCyiK1/T9v8fwXKtXlC0SzgWISO9bpXY2Kro/7l+RUWS6cN3uDchq9wZZ/OJCRtV9S+
	Qz0eePigm9uuVjgS+WRL2Lk4/hCc4q0ciIDWcaPiJ9cW1hiUqT0TEH59tY/9JaWQeoshOG
	IQVtdHcOoiAee7wiBJzxZeQM4T4RF4Y=
Date: Wed, 14 May 2025 14:33:23 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 4/6] ASoC: SDCA: Create DAPM widgets and routes from
 DisCo
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
 <20250512124240.799509-5-ckeepax@opensource.cirrus.com>
 <470de11c-82b1-4d1f-aa52-e0849ea261e1@linux.dev>
 <aCMXXaF56CAKEHGX@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aCMXXaF56CAKEHGX@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/13/25 11:56, Charles Keepax wrote:
> On Mon, May 12, 2025 at 03:46:40PM +0200, Pierre-Louis Bossart wrote:
>> On 5/12/25 14:42, Charles Keepax wrote:
>> It's been a while since I reviewed an earlier versions so now I am confused.
> 
> I have attached the output of the dapm-graph tool for the UAJ
> component for one of our devices, whilst a headset is connected.
> Hopefully this will help to make it a little more clear what
> the generated graph from this code looks like. Hopefully the
> attachment makes it through the ether, let me know if it doesn't
> and I can send directly.
> 
> The PDE supply widgets are what control the PDE power registers,
> they will power up when they are attached to an active path, ie.
> a valid link between an active source and an active sink.
> 
> For the streaming terminals IT41,OT36 they are active when the
> audio stream is open. For the non-streaming ones
> IT31,IT32,IT33,OT43,OT44,OT45 these are active when the pin
> switch is enabled which it is by default, without pin switches
> these would be always active. The pin switches are not shown
> on the output of dapm-graph.
> 
> You can see the effect of the GE control, where it has set the
> input of SU35 to FU33, by the selection of "Headset". And you can
> see the virtual mixer switches going into MU35, currently both
> Mixer 1 and 2 are on, so you can see the paths connected.
> 
> But as you can see the correlation to the function diagrams is
> the spec is pretty good. As I noted with a few minor exceptions,
> like the GE having more paths, since it must connect to all the
> widgets it controls separately. And the DAI widgets that are
> created by the DAPM core.

Thanks for the diagram, very useful indeed.

The only comment I'd have is that all SUs are represented as MUXes in this DAPM graph, but in practice most of them are simple on/off switches. The case of SU35 is one of the exceptions to the rule where it can have multiple inputs. I don't really mind if all SUs are represented as MUX, but it's not a direct mapping from the SDCA spec.


