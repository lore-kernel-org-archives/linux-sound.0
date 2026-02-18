Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4939E2DF3FD;
	Wed, 18 Feb 2026 17:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771435052; cv=pass; b=Jffs5J3q0TnIE6egwKARgoX0OwzaS8dhlj9szyZd233LE54S4Fk4c3xW36sp0zQVXnjvNpKFi9ikS1V+DSKUAJh/1mzfG57stI35k2nppNoC+dvqbqU0m+IJs2Ygg9A1xpL4qF7eB3EhGq4jD0mpYztjaBf7nyJz6BMa379owTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771435052; c=relaxed/simple;
	bh=zrdW00y3UNJdbtAIip/CopdfZPRX2IqY8VRTzvZ1sSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=moAmwkTln7GNVLVY9sO1yzCi5lOmcvljrrr/bQRIYm2WLQixryYdanP1DlBVxNKiMO3XtKhMx62ob3X22mTF+1FkNpYP1/GtkAU90IjZxnS9iUnM52+vfDGTIlYJg406vzfKjsF/iOLlHxRtl2H0wApvC5G7OUwDVouuLGgYlHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=UnJCmaEQ; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="UnJCmaEQ"
ARC-Seal: i=1; a=rsa-sha256; t=1771435028; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hi5kGH6lyRdefVCwuBY9IIWF3vRopGJ8dV4E5SNT06hNIRk/kTJTW/h/0TOaEO+XIiLGlbH5ezNwAIpoqUOJj+jexBAXl0VYR869ZXtBzFAWpjBPFRivz3tMbcrthvHdTZkZI0PmMCjkN9MtHHivG2VZdCpR92BWcYAXwET02e0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771435028; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=H2xxKVmqo/G9RIHRWeTC2HYdGopJIE+Mth9Uo0KlJd4=; 
	b=gHQSfD74rF1+ApPqyaT6nYIIeC0UO7PVxocbaxzW1QRqUSrvAF0jdSliGN9F6Bl7rkH54Ar6Nnly3oFCyIwdDCgqoNBqcgF3Q7inYDXcI5MJ6DmDQOWiTP4FcYJmoF6ppfRuElMzqiSunzFyCLy8PmvgtsAI2P/o6ZpSIBnJo5E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771435028;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=H2xxKVmqo/G9RIHRWeTC2HYdGopJIE+Mth9Uo0KlJd4=;
	b=UnJCmaEQFt5FpIqdLUI9xhfIfn4rUuheKM2nLAAz5YcEyAhgA2qx32H6kGkl6CG0
	QStucyzTOtBqDfcganCPT9F6CJtrX8VAQzu3tZqscRCBRiJ9vFKuvd0JRMIJn+b1pPo
	gtkDX47ldxCghBDUH/p7utuSAVlKgL8Z+UUeOLf8=
Received: by mx.zohomail.com with SMTPS id 1771435025979786.7325301917416;
	Wed, 18 Feb 2026 09:17:05 -0800 (PST)
Message-ID: <86644ac4-6ffd-48c6-a79d-8e8144f18e2e@collabora.com>
Date: Wed, 18 Feb 2026 12:17:04 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Re: [PATCH v1] ASoC: rockchip: i2s_tdm: Re-add the
 set_sysclk callback
To: Mark Brown <broonie@kernel.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 alexandre.belloni@bootlin.com, thomas.petazzoni@bootlin.com
References: <20250117163102.65807-1-detlev.casanova@collabora.com>
 <DGB6VK7LC8N7.322SYGWZXPL5W@bootlin.com>
 <DGI2YVYBECUM.3O0UN9VMKF7FJ@bootlin.com>
 <34f61d25-607c-4967-bc67-3c7517c7fe14@collabora.com>
 <DGI8RSUWQ7W8.MDY7YGXPA5LX@bootlin.com>
 <e1cea076-fb1e-475e-b6a5-383370a69722@sirena.org.uk>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <e1cea076-fb1e-475e-b6a5-383370a69722@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Mark,

On 2/18/26 12:10, Mark Brown wrote:
> On Wed, Feb 18, 2026 at 05:51:51PM +0100, Luca Ceresoli wrote:
>> On Wed Feb 18, 2026 at 5:01 PM CET, Detlev Casanova wrote:
>> +		if (!mclk_rate)
>> +			mclk_rate = DEFAULT_MCLK_FS * params_rate(params);
>> With this, and DEFAULT_MCLK_FS defined to 256, arecord is working again.
> I did have the revert queued, but a fix would be even better if the
> patch could be sent?

A fix will follow a bit later today, then.

Detlev.

