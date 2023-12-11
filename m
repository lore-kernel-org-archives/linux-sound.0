Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=michaelkloos.com header.i=@michaelkloos.com header.b="Wn4+BVtm"
Received: from m228-62.mailgun.net (m228-62.mailgun.net [159.135.228.62])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8073DA
	for <linux-sound@vger.kernel.org>; Sun, 10 Dec 2023 18:49:02 -0800 (PST)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=michaelkloos.com;
 q=dns/txt; s=k1; t=1702262941; x=1702270141; h=Content-Transfer-Encoding:
 Content-Type: In-Reply-To: From: From: References: Cc: To: To: Subject:
 Subject: MIME-Version: Date: Message-ID: Sender: Sender;
 bh=A/tmcvt2MvyOgT/CgTKH5Vk/7MTNcX8NCoOsDmu1SXk=;
 b=Wn4+BVtmuPfO8TCTUPuwOrri5zsooCb3YR6m+Ze2hGIzbIRLZSkkMFsTWxfA37ruNDfbkqtK/0Lxrl0JUsA3mbQyu/zCxXIBp2+WQ5xkPkUB8m0emx3n0+6F8+QiI0ad7zCWgWtDzVaB9jL1wzajr9UFhiqE5Ssrap7gsR4WlP4=
X-Mailgun-Sending-Ip: 159.135.228.62
X-Mailgun-Sid: WyI5OGNlMSIsImxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZyIsIjQ4Y2MwIl0=
Received: from drop1.michaelkloos.com (drop1.michaelkloos.com [67.205.190.89]) by
 73de24a98ee6 with SMTP id 6576789dd0b89648ec75a99d (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Mon, 11 Dec 2023 02:49:01 GMT
Sender: Michael@michaelkloos.com
Received: from [192.168.0.103] (173-088-115-050.res.spectrum.com [173.88.115.50])
	by drop1.michaelkloos.com (Postfix) with ESMTPSA id 9A3434002A;
	Mon, 11 Dec 2023 02:49:00 +0000 (UTC)
Message-ID: <cbf8ac6f-5e8d-4430-aba7-853cded5a9c6@MichaelKloos.com>
Date: Sun, 10 Dec 2023 21:48:58 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Enable built-in microphone on Lenovo ThinkPad P14s
 Gen 4 (AMD)
To: Mario Limonciello <mario.limonciello@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jeremy Soller <jeremy@system76.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 August Wikerfors <git@augustwikerfors.se>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231211015325.6793-1-michael@michaelkloos.com>
 <05b90060-9bee-42db-a49b-eb73dce0d59c@amd.com>
Content-Language: en-US
From: "Michael T. Kloos" <Michael@MichaelKloos.com>
In-Reply-To: <05b90060-9bee-42db-a49b-eb73dce0d59c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> This is supposed to be supported by ACP 6.3 (Pink Sardine).  Did you
> enable that driver?
> Can you please share more about your problem?

Enabled it and it is now working.  I wish I knew that 24 hours ago.
Would have saved a lot of time and effort.  Haha.  Disregard the patch.
Thank you, Mario.

