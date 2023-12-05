Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F0DB0;
	Tue,  5 Dec 2023 01:13:02 -0800 (PST)
X-UUID: e962ee4f3bb24affaee15c584930d555-20231205
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:c2466f93-acc4-4890-9309-6c90a73c9805,IP:5,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-15
X-CID-INFO: VERSION:1.1.33,REQID:c2466f93-acc4-4890-9309-6c90a73c9805,IP:5,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-15
X-CID-META: VersionHash:364b77b,CLOUDID:04e6d560-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:231204193409M5FRDQ5Z,BulkQuantity:12,Recheck:0,SF:66|24|17|19|44|64|
	102,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_OBB,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD
X-UUID: e962ee4f3bb24affaee15c584930d555-20231205
X-User: chentao@kylinos.cn
Received: from [172.20.15.254] [(116.128.244.169)] by mailgw
	(envelope-from <chentao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 2045572178; Tue, 05 Dec 2023 17:12:56 +0800
Message-ID: <6292bf7a-e56f-4f7f-843f-b95c1cbd343e@kylinos.cn>
Date: Tue, 5 Dec 2023 17:12:54 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: Fix null pointer dereference in sof_pci_probe
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
 kai.vehmanen@linux.intel.com, perex@perex.cz, tiwai@suse.com,
 chao.song@intel.com, kunwu.chan@hotmail.com,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231123155424.1275919-1-chentao@kylinos.cn>
 <7ddeea58-f5d8-415c-8c07-c34be04d6a9c@sirena.org.uk>
From: Kunwu Chan <chentao@kylinos.cn>
In-Reply-To: <7ddeea58-f5d8-415c-8c07-c34be04d6a9c@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for your reply.
I'll check the patch and modify it by a better way.

Thanks again,
Kunwu

On 2023/12/4 20:38, Mark Brown wrote:
> On Thu, Nov 23, 2023 at 11:54:24PM +0800, Kunwu Chan wrote:
>> devm_kasprintf() returns a pointer to dynamically allocated memory
>> which can be NULL upon failure.
> 
> In addition to the issues others mentioned this doesn't apply against
> current code, please check and resend.
