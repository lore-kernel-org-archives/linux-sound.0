Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8CA35AC3E;
	Tue, 14 Jul 2026 13:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784036571; cv=none; b=TRWOctFNRzRmu0OR5QRw8TShbsd2dChUr5WbMe1a0vGOcqptS+qnOstYlaYuRMgXEE/rPCv6u/xInyCtAfYWU3pFoO5Eg8Y0n2jAL8EllO1If5ju9dXdTX2TySb5JyUgsFI/Q12sCcm1K8f4fup8GLuUXV3jQ2QZxhErA6u1BM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784036571; c=relaxed/simple;
	bh=RrZnmbU7Jfts+jBibdvB32hWeQlCYlv7V1m7imm2w4I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CnNbF7wMfbFz2UZU3S04EAavAodSGVMls5bmVMiAzpdwgBwQIrvQukziNH/CbhjGcisKmDrQVZ69P12ts7/u1iUm1qjGmi7UNsk+b27aBe519C61fgHQX7ixQNdoF4HcFiys1EhdF9AoR/t608LOPwJgsDSdPXWRA713XtqoRyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5PbNHVB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5PbNHVB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 864E81F000E9;
	Tue, 14 Jul 2026 13:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784036570;
	bh=TBI6CBUZz/QQ2eOVHqjtzx24L47Q5vRpMbgdlKzuQLc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=l5PbNHVBmv2r2Jc5lut1hnVaXtGzJtFCa60NLl2c7/lo9Knzp922sSgdxNMlT6rEy
	 JsNNCcFp0NLaVRlCeDJxTZZRrKKUa+Zca54SiMHb+ZJBNzVy/xYuJ09aByjNOCLQ8H
	 3dlufR6DFZs4GXGCbvwOJtTfi8/XzV6zr66wd8m7EWslR3VHQ1Yq1dSFQx1BIv89B3
	 IU1shuL4zFPEGXsLhfSQ9jHBWtv59dszdp4gWgFYf+R0y4N91NBvcyiOZvKEd3FMb3
	 T/ALm0RmWApOeEj9WbmLeR4OvdT116qapn3VK3odSR3D8EhUmT+BYWLo7p/TkNyxke
	 sdCM2hxSX7drA==
From: Vinod Koul <vkoul@kernel.org>
To: linux-sound@vger.kernel.org, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 bard.liao@intel.com
In-Reply-To: <20260703011656.2572959-1-yung-chuan.liao@linux.intel.com>
References: <20260703011656.2572959-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: dmi-quirks: add a global ghost list
Message-Id: <178403656815.851500.11132974061107229047.b4-ty@kernel.org>
Date: Tue, 14 Jul 2026 19:12:48 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 03 Jul 2026 09:16:56 +0800, Bard Liao wrote:
> Not like other ghost devices, the 0x000000D010010500 ADR doesn't belong
> to any codec. We should disable it in all devices.
> 
> 

Applied, thanks!

[1/1] soundwire: dmi-quirks: add a global ghost list
      commit: b7a5d101d7d267922e828c40135bcaccf8cfb3bf

Best regards,
-- 
~Vinod


