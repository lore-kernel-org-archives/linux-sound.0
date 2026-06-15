Received: from framboos.boetes.org (framboos.boetes.org [185.69.247.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD6B2E7631
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 09:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.69.247.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781515567; cv=none; b=MxAblPIFAPpxEHVHqmK2fyvvTvcIiNI/G3CeOjNHzSdh6ardXkVx02vd3BH3y56e8PpKSSLx3Gfhz4iJsic1P8m62W0U7c3D5xRDJqQeC3FLdVWHDokpnICLwmBZe3vmNCu+pzSzXoZdsFN9j/yB3uUzsc4g74XbBsVR4IjvsAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781515567; c=relaxed/simple;
	bh=rL9tqJACNgBuAIY7UmTm1aJBESU195aSWqZ/JIfke04=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=f/UDeYnYozHDJ5yX/nFs4Mk8eNoab6R53T6abJSSiCnN6Hn/CzRs7Eikq9ob0jzMBm821m5YvjxfbTt72j/yDF1SmYXGIOlEqGETpwqlTM3/su+h8vFIXrV9j6TEcXVgLGgTK8FPbLY7/ZkZz64PGcRBkmTP/EFX6y3squ8mZPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=boetes.org; spf=pass smtp.mailfrom=boetes.org; dkim=fail (0-bit key) header.d=boetes.org header.i=@boetes.org header.b=MGL0YOkF reason="unknown key type"; arc=none smtp.client-ip=185.69.247.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=boetes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=boetes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key type" (0-bit key) header.d=boetes.org header.i=@boetes.org header.b="MGL0YOkF"
Received: from [192.168.254.148] (unknown [192.168.254.148])
	(Authenticated sender: han)
	by framboos.boetes.org (Postfix) with ESMTPSA id 0EFEF92B0B1F
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 09:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boetes.org; s=woosh;
	t=1781515042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rL9tqJACNgBuAIY7UmTm1aJBESU195aSWqZ/JIfke04=;
	b=MGL0YOkFsdNTBcDug61NWApoDtPB+MdWEuwty4pwcmNqkIkTO/gv5o4IJAYzLjb8EDwHsp
	RPFFQmyWWe83manfuX3QjH2/JF14PDBg/lX0YsEx0I4vtz5K4zc5KE13H+oQBArbIJ/m6+
	aRyYdB3pOg2KPCCglPDNK11yjp//ANk=
Message-ID: <4b309b05-e3e8-478a-9377-33dd8a17483a@boetes.org>
Date: Mon, 15 Jun 2026 11:17:18 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Content-Language: en-US
To: linux-sound@vger.kernel.org
From: Han Boetes <han@boetes.org>
Subject: ACP63 (Pink Sardine) DMIC, snd_pci_ps bound, acp_ps_mach bound, DMA
 running, signal flat
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello dear devs,

My microphone is not working, just producing clicks:

ThinkPad T16 Gen 2, model 21K7CTO1WW, Fedora 44, kernel 7.0.11
ACP63 (Pink Sardine) DMIC, snd_pci_ps bound, acp_ps_mach bound, DMA running, signal flat
https://alsa-project.org/db/?f=f49f49993405253a366501c20cb220e1db90a93b

Please let me know if you need more info or if I can test something.

BR
Han
