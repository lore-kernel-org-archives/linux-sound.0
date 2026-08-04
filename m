Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA051372056;
	Tue,  4 Aug 2026 07:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785830011; cv=none; b=Bu5kU0hHMGY033pXFyPP0FTOu4JtQJ1Yhth56iAyYrdVKle3lIK5RhN0bJ9Obx2GFx9J2GHEpDkb5I86Nd/veVa67q5ngOcqW+dS6+kmfqH+6XHJCH8fxw3u5ffQwxRJXf+zOYd1HLd4WGIiNIUa/98QzdYoOdqBt6trE7CgH00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785830011; c=relaxed/simple;
	bh=slUQ58mogfgqKmnDl7RHm0NwJU6ljctiO293tuFmyUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RF4aipk6IPGqBi7nT/7bApw/eC8rwCND4h+HfGuhFYa2js3P1zX9NxvbG+lgJfu3sntD+ITa2ih7+kyftMDDzT49qLP+pnTUfeDqwZMLBeK7b4dWkRSC8rPa4Qkx2HXzJADuQMeuMmTMWxaQsHjGGGEXg7dj95x7h5qT7KKRkhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ndev4MCC; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ndev4MCC"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16F64165C;
	Tue,  4 Aug 2026 00:53:18 -0700 (PDT)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADA223FAF5;
	Tue,  4 Aug 2026 00:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785830002; bh=slUQ58mogfgqKmnDl7RHm0NwJU6ljctiO293tuFmyUM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ndev4MCC/wSB0yKuTYdRjWC6ZZrALcq9XdVn/ZczUtcWnLoN7kcTmtrek24djVEga
	 R3TN7iqzcVJGHeqcSYkxPSKlA53yFpXur+jcVJB7I3rFo0Uum2mBlScndUObMK7Y8N
	 x+HT9WhaKmqy39FaSmEDgC6Y14diZctJ9hSusPB4=
Message-ID: <6ddc4eab-1ec2-43f1-9fb1-310f5e8cba7b@arm.com>
Date: Tue, 4 Aug 2026 08:53:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: xilinx: replace OF with device handlers
To: Rosen Penev <rosenp@gmail.com>, linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Michal Simek <michal.simek@amd.com>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260803231823.95147-1-rosenp@gmail.com>
Content-Language: en-GB
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260803231823.95147-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04/08/2026 00:18, Rosen Penev wrote:
> All of these usages of OF handlers use the node from the
> platform_device. Use the device member to simplify slightly.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Thank you!

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

...
