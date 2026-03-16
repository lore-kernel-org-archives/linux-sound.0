Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E264020ED;
	Mon, 16 Mar 2026 03:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773632015; cv=none; b=joZcMOz9LgGQGB4hO8ClzuAJzOx2+8l4/bxVzSYbLztM0FI8rc0UrYh1pOF6wPjgS92OhJGtzjrd+f7Zw70PvwAmISbmCL15LzS4KOBvUH9WdNi8BEjVT4UbPnUdRHmUfTPQ5CpUtOxWEkky4C2jj9idOmZ9NN/br2Bwq8nk47g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773632015; c=relaxed/simple;
	bh=6iSEXAUgailqD5Lcv6BQik98W8CfNxq5OQvC1IqNVvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WmdJO84wWdTOh+DvVVy0/Z0YoQhVaYcpe0uTWtlVXSZxWBiIA4ixxOjSWTTInD7WYgEa1JHBmWoPjG+nMufkjG9bKCjsfKEsxd99NoMzqXxYEB+WBEh/iyXguHowsl2sdXMNkaDoShag5NREzegrDcArf5t9YvTf6FRCq6K6Big=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: e46db49820e811f1a21c59e7364eecb8-20260316
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:4bc73fd2-2739-4bd9-8bbb-e5bacc65ddf4,IP:0,U
	RL:0,TC:0,Content:19,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:44
X-CID-META: VersionHash:89c9d04,CLOUDID:3905ba41c8b941d3009e4f7efdb8d92b,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|898,TC:nil,Content:3|15|50,
	EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e46db49820e811f1a21c59e7364eecb8-20260316
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.76] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1953048488; Mon, 16 Mar 2026 11:33:26 +0800
Message-ID: <12ab2716-6870-4c34-a4af-a20b190d53be@kylinos.cn>
Date: Mon, 16 Mar 2026 11:33:23 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK
 BM1403CDA
To: Vee Satayamas <vsatayamas@gmail.com>, perex@perex.cz,
 lgirdwood@gmail.com, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260315142511.66029-2-vsatayamas@gmail.com>
From: zhangheng <zhangheng@kylinos.cn>
In-Reply-To: <20260315142511.66029-2-vsatayamas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Zhang Heng <zhangheng@kylinos.cn>
