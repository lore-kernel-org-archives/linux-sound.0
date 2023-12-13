Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BaO6/jun"
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF15BB0;
	Wed, 13 Dec 2023 02:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702463738;
	bh=viWUiogueJVv5biI+umTb/N3GgCvcB5MX5R0x153QXk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=BaO6/junNe+bPVn+4mmm+vz+40b31nCMQ4BVQVdRiJFtHfoY2NSZRlQvbwv+XhzR5
	 p+GOUUfdmHof+/JzjsHOBBnpzLlkfpsWhQ3fSl2pwDrdlof8w7U0TSEKuDiFwgFA3z
	 dLaG+IvWQxnYzw8XoHd3vyk2f2sH68mYqmUTZxoqlkHnzFGHrBYKV8XuJbLvFmmS2R
	 olObNfym2FGRsRq1ygRLdfd3g6hqM6u8Ba+YeASQFv4VRSs+JTVVJWQ9ecMdd5s1VT
	 PUYzaqNNm/QP+/qSTEKEOjjgPhcd/W3td8ILXYs3o9ClAalXzcvntjdUqVqqW6Ks01
	 HBM3H3+TWvlzg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3BD363781453;
	Wed, 13 Dec 2023 10:35:38 +0000 (UTC)
Message-ID: <38909757-5b30-485a-8482-b75a36f1442a@collabora.com>
Date: Wed, 13 Dec 2023 11:35:37 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: mediatek: mt7986: silence error in case of
 -EPROBE_DEFER
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maso Huang <maso.huang@mediatek.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <b941a404d97c01ef3e30c49925927b9a7dafeb19.1702422544.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <b941a404d97c01ef3e30c49925927b9a7dafeb19.1702422544.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 13/12/23 00:10, Daniel Golle ha scritto:
> If probe is defered no error should be printed. Use dev_err_probe() to
> have it muted.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Reviewed-by: Maso Huang <maso.huang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


