Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A112749C4
	for <linux-sound@vger.kernel.org>; Sat, 20 Dec 2025 11:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766231289; cv=none; b=qj7YoyYltVWDTHGRSUvnudXrRLiXj45HVhuGLk7MiKFOgAj81/FV2jRPHCumc7enIceKJ5N8nTZxTRdVMow7zhNxyHc48NxFS9neOmzCZgvQ9SOAaFb5EbXdBs3YEJiZjhqqKAkQSXdu6OuPVPLPtDVkzi3DH5tbETd8aF/AsZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766231289; c=relaxed/simple;
	bh=mxIQ/mlS/ganQDVCe5nl483oS1ULJoUzVgvp08XwGGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VW/TrfcQOey3Cc/YhxYtTsBh9MCKaJiiRgfIn8ywdFivLcDh7lGt5M7P70I5UkzFABuxMEcKKjaUNuL0XscvWqiYMuE0NUAHxms3eJ+oV2RhMdvjAchCdfvouALtjh1ZDWrbevyiG594vgkJRMu97z8zboNa2NJg4pbtkiaQY4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JtX44g5j; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JtX44g5j"
Message-ID: <d6f28859-6430-494b-a76e-68e4ee2615fe@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766231285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b0W46VyP/lplJbjA/UAkh1JjB5jJxAWktGBt9pPujbM=;
	b=JtX44g5jpGL9NCxC1koJ2DcuNyFblcU+5jfFf7YDOsr6OEnAhm7JCHsl4jIOG2cTiy2BBF
	xhm/OOr344lkcJ8rgFiW31dr8fdcOPlXinqb1F68HkTNftjpiFxp2BXWAsrcp/FN9XG/8P
	74iztFMJUOf+A3tBtk1Bn82ueWkWIFA=
Date: Sat, 20 Dec 2025 12:31:52 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 5/7] ASoC: SDCA: Add basic system suspend support
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, yung-chuan.liao@linux.intel.com, vkoul@kernel.org,
 lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
 <20251125152128.274808-6-ckeepax@opensource.cirrus.com>
 <02bc8d1b-ae25-4398-acc5-e5779c245a3c@linux.dev>
 <aTmHBbS22GyoH+RB@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aTmHBbS22GyoH+RB@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 12/10/25 15:43, Charles Keepax wrote:
> On Tue, Dec 09, 2025 at 12:11:27PM +0000, Pierre-Louis Bossart wrote:
>> On 11/25/25 15:21, Charles Keepax wrote:
>>> Add basic system suspend support. Disable the IRQs and force runtime
>>> suspend, during system suspend, because the device will likely fully
>>> power down during suspend.
>>
>> Power-down during system suspend (seems natural) or power-down
>> during pm_runtime suspend (depends on what the host does during
>> clock_stop)?
> 
> At the moment this is written to support FDL after system
> suspend only. Which is fairly typical of most devices I have seen
> (Cirrus and non-Cirrus). Generally as runtime suspends happen
> so often it is preferred not to download firmware there due to
> time constraints.
> 
> This is definitely up for debate, my primary issue with allowing
> firmware download at the runtime level is that SDCA gives you no
> way to tell that the device is ready to rock. The only way I have
> been able to divine to do this is to wait for an FDL irq and if
> one doesn't come within a reasonable time out move on. However,
> that waiting would add a considerable delay to runtime resume
> even if no firmware was downloaded, which feels problematic.
> 
> I guess my two questions would be:
> 1) Do we really want to support downloading firmware on runtime
>    suspend? I am doubtful it is really usable due to latency.
> 2) If we do, do you have any ideas about how to determine if the
>    device needs firmware?

It depends what happens during runtime suspend at the host level.

In the case where the host issues a BUS_RESET even during pm_runtime resume, you will have to re-initialize the device completely, no?

If the runtime suspend only does a clock stop, then presumably there's nothing to do on resume on the device side, i.e. no firmware to reload.

