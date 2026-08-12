Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0570E33A6F7;
	Wed, 12 Aug 2026 06:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786515218; cv=none; b=UZjxSxA89k/BppbTrHTJ6d28skOt+EQnLefraJStu89hW0xKXhAtyl2EL/up65vyDe5F/rCH7vSrQDLJM3s3/g+V1rtzOP86icodTMLIIMTbQRgfugu2nV1GnrcEgDUVK4DJhZJqfIr03Uuy262Nkt/Id7Dsbh6kAm8Y0vLCPjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786515218; c=relaxed/simple;
	bh=+97eQgCji9sNbU/Qzga2naHnQbyNVNXr+PewirPY+sk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l4HH5I05L+b2uuI+RSKcSnMqEMUFi8WkPGSmdwWNHHsnOYDQev8e50oUR97WR1Ptef2A6c1950dd7nyJMAGmflHlTQV5AMqFSMv9eBV9rUiMYTKlG4I+f+OU1/JYyYtC1v/hhLKZs5LsH6l04mkCFBc+sL0tJp3hMeN343ICj/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=l0mqd9c1; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="l0mqd9c1"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E1721596;
	Tue, 11 Aug 2026 23:13:31 -0700 (PDT)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E778F3F86F;
	Tue, 11 Aug 2026 23:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786515215; bh=+97eQgCji9sNbU/Qzga2naHnQbyNVNXr+PewirPY+sk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l0mqd9c1S44ovYmJTL6E5ds/2Z45IN93MHLWfF2RsMU0ybUK+wHbUUBD7StJP9yoS
	 2/Cx1FX7tV/TCXtQwbbI+p8OXgn5JYv7DGwJ5omPt5WjiwRsVJqci1Sg1hU2H4yJZe
	 3zfwRu/RhoSz/lrmukKPEdUjRjb7TJsOZYFYjv4c=
Message-ID: <db63ceba-68b1-4b3d-ab8a-9ecd2231ad87@arm.com>
Date: Wed, 12 Aug 2026 07:13:32 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] ASoC: xilinx: formatter_pcm: use more devm in probe
To: Rosen Penev <rosenp@gmail.com>, linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Michal Simek <michal.simek@amd.com>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260811185013.26960-1-rosenp@gmail.com>
Content-Language: en-GB
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260811185013.26960-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/08/2026 19:50, Rosen Penev wrote:
> Use devm_clk_get_enabled() to let the clock be enabled automatically
> and cleaned up on unbind, dropping the manual clk_prepare_enable() and
> clk_disable_unprepare() calls in probe and remove. As a result, move the
> clk struct member into probe, which is the only place it's used.
> 
> Simplify the probe error paths by returning directly instead of
> jumping to clk_err, and use devm_snd_soc_register_component() return
> value directly. Also remove error message from ioremap as it throws one
> itself. Same with devm_request_irq().
> 
> Assisted-by: opencode:deepseek-v4-flash-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

[...]
