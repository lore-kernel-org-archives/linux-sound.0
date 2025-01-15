Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023084.outbound.protection.outlook.com [40.107.44.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562CA4C98;
	Wed, 15 Jan 2025 03:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736912293; cv=fail; b=AUytxrzDLdZYU0MG/GndbXaLaOVAt4i2iEoI+GwSMqRBA4R2mYhtZAyYN4KkLfWOtVRpu0U7UG4AkeVagEkTErHrZf0ZyqjlpWeIOwVEJ5K2IoDWr+gPTtbX9kyBdCz87bl2o9y4EcscdoHTA0SnBs4437nKZrXubFv8eOFkogM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736912293; c=relaxed/simple;
	bh=FtjJCzBCtTs8Xr2xVowUqCxHnT06y4ydcpIKhX2t0dI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B/ciCNNQKEib8aZLrJvk3ToSZ/+bS4mUDm5scZRI6xL02wExmBvzF79G5kxLu+ldibc0jbVdF26LPagD/VzLH0ERtWuxcUxbG/uc/RTP27PWESB/70sD3teX1QU3M9NGp2w7mp7+27IHJ2Abr6BERI3sKj8N4eYE16pYMagMmBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=jBpEwXKq; arc=fail smtp.client-ip=40.107.44.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="jBpEwXKq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DmKkGrWTM9EuQpyXqePElbr1UVizQCN05Bf4OqOxVxzZMuYOtUB4WUUMPLek8mGEdUGGlkrzvGQr9AubftNMNpem+TFNnENmX+kXJ+mG28Pu7ll6zF7UvRuy3DeZx1sLPV2M+sXitmWoca1zrzOrcvHguiPSTffAk0cX2h/7gDoqLQ7dcJX+lr0eP/Ruln9fAgg+d+IODEveAu7UW0QO8Oj2l/08EFfoccR8qlIJyF/HZIdJhl9I/VJrMtfBiSih47fiphknRh2l1spXdLhj4os4i0jTbIt3i/64Des6L6FnF0iUzLeYR8w9Pbc7bKMQq13gv3HG/RWxyJ3WR72NZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRCeVDpPJjrRvbNX7nI8MnQJjOO2BDRW59+681yfLzU=;
 b=ytu7gfb576vP6xnO1dTNC+AClkhdACrDgOuBlCuFOOkIzzYkCzflf209Ma/62zfgEmkzbwBTZgER3gkDHDQv9KzpeuGJYcGXBp2OPhDvGcN2VOnZhNzOddXOLiS4+CXqEcbnz14fwFeu5ThSEc+GkuJ4Tbo2GodS3gFy7OIZ5j13aCUurnT18FHCwM5I/8VI0yaRcfbGlvgIgRLA29ht8b/1FLFIWy+xekogBermH62IfxnNxT6FTMsjGp5ouIDclqt4TR7x7lhR+d659SfDbucvMmeXnb8g3H86cubyo5seFBl1PSqHFqUZnjrLV6i4ojQNzBCFM3M9jODBYRUCew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRCeVDpPJjrRvbNX7nI8MnQJjOO2BDRW59+681yfLzU=;
 b=jBpEwXKqlbVfAveivOJt+8Xoy41W4AHhOQoJNY3lBE06lNNkQZC0mVB85EG8sVSqTwAsj1kl6V8eyYvJ7Q44v/FFTUqJgtNX4oXpBjlzSv673RPoxxGSDTVdkpV8iU37C+abZpRxh3d/iCCDn7WZXp+gpmY+d9SrgA7VnAaLHd1l3BZYvxhnYfvq/b4vYyBJPlv53Dn+lj2VDiz+CQTmBbmKhhb/fMCmESYhMURumYc3k96NPId8JRIeuT7pkY2ealDrE+0R97VrdEx3WuUFrxwR+nEmGMD3Wp8edLZib1ctbl7o0Y98Csn15JFqYPRH96zzwlE0II/wBltsFAgL6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
 by SEYPR03MB8180.apcprd03.prod.outlook.com (2603:1096:101:1aa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 03:38:06 +0000
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d]) by PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d%3]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 03:38:05 +0000
Message-ID: <40aca60e-92e7-4344-8f7d-f62a61dd1898@amlogic.com>
Date: Wed, 15 Jan 2025 11:38:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: Add Amlogic S4 Audio
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com>
 <20250113-audio_drvier-v1-3-8c14770f38a0@amlogic.com>
 <1jldve939f.fsf@starbuckisacylon.baylibre.com>
 <813e2564-8c4c-4adb-8184-ab88156e3e4c@amlogic.com>
 <1jmsft7ihz.fsf@starbuckisacylon.baylibre.com>
 <0e8b78c1-5c56-40e7-a2d8-41a7f49d52bc@amlogic.com>
 <1j34hl7a8b.fsf@starbuckisacylon.baylibre.com>
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <1j34hl7a8b.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31)
 To PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB7135:EE_|SEYPR03MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 48cd82d3-7cb9-43cb-2b90-08dd3516052b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2xJUFhsY3JFSzhrakF4bG00TDRDT0Z0UC9jVWdDN3Qwd0RncTZ3ZTdGL2Nk?=
 =?utf-8?B?ejRHWlBCNlJYQ0NXbHZCWUpXWHdudkVJUENnOGR2anV6bUU3dzBmOGxPQmdN?=
 =?utf-8?B?eGZVOWZEWkVOTWdvaXczMWxuTkl0WVZIRGNzcmhMTE5WRzh5dndmVHA1RUtS?=
 =?utf-8?B?TTZzSXNCUTdOR3RjbERRam1yV0c2YmtnQ3k2YnUwQkVoQ0w2VVc5ZHh6K0cy?=
 =?utf-8?B?bDZWUVBpR0RDWnVRL1NEZHpaVTZJUE5vQWlTa0hnOXJIa1h6STdJMVBzMVVU?=
 =?utf-8?B?d0REWDdTZDZxLy9UdkNFQ0E4OVlNRkpwbzBscG1MQTRBSklUS0VuVGlqZ0kx?=
 =?utf-8?B?NGFHNVZsTEJhNWhpKzZUdnFVS3Q3a1NDckhEZTRhdHB1R2tvL0JQblRJWGg1?=
 =?utf-8?B?eDk1NWE0N05XSFExbXg2UDduU3BqTG84TSt3c0JtMStEV0F5cEVqbXlpYi9o?=
 =?utf-8?B?azhiM2FjVUtqZ2RyVzcyZTd0VGI4YnozeHd5Y0tBUWJtVDdqb2l3TU9hbWZi?=
 =?utf-8?B?NUNXRkxRQi9XUDlxYnduaTlPdXdkY1creEo3bXROVjgxNGFUejlMYkFFYWQ5?=
 =?utf-8?B?OGRXMjV6YzFQVzZnMjF3WlRjVDBNTmxlZHdjYSs0M0xGUFYrc2o2ell3TWhN?=
 =?utf-8?B?SWVoR3YzUXFjalhGNFVPTWNmdGY0MUFmK0lmZEMxK0VNbUdVeUt3YVFBN2hC?=
 =?utf-8?B?cThUZ2k3RUpLaVlSRFVMMC9BbStXN1lROUpHMjlVSkF6d3NSQ0NvTkpIUWsw?=
 =?utf-8?B?TExHOXFIbmJQb0NyOGNIWDBFNElrRlJkdGVTMm1qN3hRNGNTMzh6bDl1dUg5?=
 =?utf-8?B?L212YTMyYThvZlZGVVdlWlRUelhMWDhjaW5MdnYvVFhUN0M2cndWbTk2UCts?=
 =?utf-8?B?Mk9TaklSeEJRYzlCQlZFa0lQWGMweG1WR25rMS91TUZrZnAwOEF2SVB6Vitq?=
 =?utf-8?B?ekhhWTNJQ0hDNlNZVHlIeE5pSmlkdmNuclJVN0xOYjJucWRmNUNlenVRazh3?=
 =?utf-8?B?ZXdLYUo3bjhBb1MreHV3emYzZXNsTFNuMnZMNnQwS2QwVVFjT20rTk11Qncr?=
 =?utf-8?B?ZFNFRVA0aVNRSWRBL0t1TW1YcEJ2NlcvMnYwTUJaTDBrVE80cElvWGRMZWtw?=
 =?utf-8?B?cW9kVytkdDJiTWZFWVhMK0JnaGJNdkZJeXI1akxqSjhuUjh5UGgyOWtHTE0z?=
 =?utf-8?B?bWo1U1NSOTFkWWw4QXpZcVlMblMyTXNEWFF2NDl1N3R1WmZhY1ByZHhxL1A4?=
 =?utf-8?B?VnlQdDFRZXZnbnpvYkZ6NzRSZ0JXaEZMVWF5Qm9mdm9PL25iV09CdkUwNW1U?=
 =?utf-8?B?dTB0aWdFRWQ4S2lVbXcwekJqVEdyRjBRMWMxWW5Ua2pvSnN6Z00rNVJHM0dt?=
 =?utf-8?B?RWJLbjc3aDBtdUdxZjBDM3M1TXhMT3FZUDV1QnZkWXk1c3M1Z21ndFVEdTBO?=
 =?utf-8?B?b3E5alFpQ2NYUGpwZzhsR1VUd0NFUDJKa3JPNWJRMnFaWFRPRWpOWU1acVBM?=
 =?utf-8?B?ek5hQTRLa1ZOZ1F1c2tKdTR0a0laZDJrbEV3d0Z3VHVFVGpabC9KU3RSa3B0?=
 =?utf-8?B?QUlneFd2QnFLeHg1RUVuQ2d2bG4ybEhnWk85bTZNRURQVndBalVkRmpub1RX?=
 =?utf-8?B?QjJvOHZSSlNxNzUzQjF1SkhFUWlId1hPYkZtQ2ZkMzNHd1Z0WFd1ZlVVNGdU?=
 =?utf-8?B?bU5ZY05zZVdPdXpEL3FVcVpuUE1mUGdkRVJGTlhvUlorQjlaWkppN0J2QVNU?=
 =?utf-8?B?a1VOWm5vZTY3RklwVHVVVG5STHQrVU5BWUdJWEtsb25hWUUzV2hnY3pVSHFX?=
 =?utf-8?B?dHk0d0Y2ZHR2ZzZGejIzWmswVU5wdmduUDJRa1d6YzhHaCswdE9TUURndENs?=
 =?utf-8?Q?vkN7PopUuMp5J?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7135.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEFISGJBRjNzUmk2R1VLV1grS1ljQ3VYMy9ZTC8rRW9pT1dzT09vOGNQOUFG?=
 =?utf-8?B?d3VlclVCeGtEOFFXZERQNk54NTR0dktqRkN0cnBoNEVsN3J4U1k5NVFzWnJo?=
 =?utf-8?B?c1hsR2NrWS9EU0R0S0NldHFHdk5ERHNyRHFOYk1Tc3czSUlTN1dUSGludEN2?=
 =?utf-8?B?QWlEYkhtOWNLeUh4b0U1VmFLSk0xNXZIV05oeDNIV0tPdXBwVE1ENlUzUjlW?=
 =?utf-8?B?U24vSjVDYkM5bU1CT2I2blFML1YwZWM3bTlyMEFpc2pNRUJORjQxNFZybDJh?=
 =?utf-8?B?Q0libXdhdTdlWnpzSy9SeTZLcEQ2eXJONmxjVHoyaDdXZFRkMmR0Y1QybUMw?=
 =?utf-8?B?ZjVUR0pxUnZublNpL0RUUVlJUytqNXd0emtLd2dwWFZYWEJCNFhnQWxXMzZR?=
 =?utf-8?B?WExIOGV6ajJhVzdEenZvWFZXbFpONmxnUUJXd3BIRE5lemUwd0VsOE1kZE4z?=
 =?utf-8?B?V1Y1UWVnQ3BVMUptMFJlNld4SExvN0RkUWcwVmxjbEJ2RVVjMklJZTBzTGVj?=
 =?utf-8?B?L3Y1TERZRGtUaHpxelB2dW56ZmFIZjArd0RlTmpRUEJzN0Z1OTJvS2lqOGcw?=
 =?utf-8?B?Skw2ZmNLenY1UG5maHdpYWhicXFHTktuZ1pLNVBuTkVJSGppc1NlMnJ0MWQ3?=
 =?utf-8?B?bmtHVlU4a0l6UWZOdms3REhjQ3lVNUhZSFBXR25Xb1JzdzRjMlY2MWtMeFpr?=
 =?utf-8?B?WHJrdjZOSXZFSkZVTHRrY0hvVUNqRlBwTHI1QTNLSTN3Wk9mbjF6Qm45d0Js?=
 =?utf-8?B?Y2dSUWtOaEYzeXhGc1hTYlRtcmxDTGFzc0ZOeEJuTHA0V3dpbmhXOFJvcnQw?=
 =?utf-8?B?UFgyUncwOW93a2pCY01VbXdwUGNqNEFzNjF1T3NieGt1bFViN1hqKzJhUGhK?=
 =?utf-8?B?d3dEbmpHa0pWZUFPOHdXcnBzaEVOcW5uVytZUm9SUm1iZWYxa3Q0VE5XUURl?=
 =?utf-8?B?QTNlMi8yZTdka25qMlpCYmxMZzBGVUhDRUZGQU1PcVU4SHNvT09QeEhkcXVo?=
 =?utf-8?B?enpJV1ArMDlmalNjZ2szdE9JSE1tNnhySXV0R2FQZ2ZWQ3RtenZ4V1ZsUVdo?=
 =?utf-8?B?N3pTRkpmYVo1YllPNzUySU5WdUtzeEd0ekwvbTZ5V3V1a3dXRC9OZzVNR3di?=
 =?utf-8?B?V2I0YVR1NStQZmx0TTdUU3ZZSjV2SVpDRXN4QUFNd1k3S3RKKzVvcngrUVUv?=
 =?utf-8?B?UER5WmhxdWpMeHVqbDYvenZ3WEZPYUhGY25UZVRORGhhRU9VNXlwZ0tZblNZ?=
 =?utf-8?B?cnJIZ0JGaGY4SVFqSFRJZFVmR05iU2dtMDVvTmVhKzJHanNkZ0Y2UjBod1dB?=
 =?utf-8?B?WS9ZSnBYOFZkNERMM21BWUNZSnJYYnF3dXFYbWtVNGNONnpVNlgveWhnY3F1?=
 =?utf-8?B?WGxjTEZPakp1MklLMU1sOEM2c25ncHhwMjFFcVFIOE16elJxdEUrREd1dlNn?=
 =?utf-8?B?elhGcnNVcHJOYjlqMXpDTEY3L1RNZGJFTGZoZ01PbTNrZkJFWG5sN1c0dEFB?=
 =?utf-8?B?VmpoY0cxd3p5K3pEVUlybThMR1VRemwwZTdEelk3TzNsSUVRaDNxaDBRSFhU?=
 =?utf-8?B?bERmQjhDalhsVGZuL3plakpaZHhzQlpzSDl1ZXRGYk5KU05NTVlucDZBS3Ry?=
 =?utf-8?B?SzhGa1dCcGs5cnlqZWw0cnVpdjNmK3hVdEFQK0hYZktJVDZtbGtkTXNzSHNk?=
 =?utf-8?B?Wk1yVTF6TnZVUzJTZWNxbUV2RFBzcWF5alNONkxHRUpFK0tWd0QvQXMwOEY4?=
 =?utf-8?B?Uk5Sd0dmOGUvUU43T1VrSXNVekF1VSsvL1ZPM25VL1oreDdOQllCMEdvR0NG?=
 =?utf-8?B?YWk1OHFjZXJ1RzV3S25YTlRBQlFEaExCSHozZUNiVVVNaHE5dXcycG5VdzAr?=
 =?utf-8?B?ZlRTR0tLaUcydVc0cjRyUTVUaUhOek43eURzZ0EwemRZNWR1TWZGSm8yeS8v?=
 =?utf-8?B?ZWt4ak54Z3AvYUJwbjdPNVRlVWFWbFFvNWtEcXVFa0xNWHEwRWI3OFAxZytn?=
 =?utf-8?B?a2ZIZ2VVRyszckp1RGRsMlZSNVkzd2kxNFNMYlgzVVdWS005b21wRXBtL1Jt?=
 =?utf-8?B?V0twZlV3dzcrLzk4YWxHeEdWbnA4cGJWdGZ1R1dvUFM2bFg1UDdBelR5cDht?=
 =?utf-8?B?bnNJQTQxbE5NRkhaMkVyVlZMcTRSbUpCTG1Cc01keFRzcTh3c0tKa2ZMdTFJ?=
 =?utf-8?B?b1E9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48cd82d3-7cb9-43cb-2b90-08dd3516052b
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7135.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 03:38:05.0607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUEz9cTaNuDV0veYX23Aj2P7sXeXjmvICtmbWu0g+FDFYBw6ftKYImXKGMgDW3dJXi2m0iZ5KeZUX9SgUN4wW8uLoZDVlU4JUluhvyefXzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8180


在 2025/1/14 22:15, Jerome Brunet 写道:
> [ EXTERNAL EMAIL ]
>
> On Tue 14 Jan 2025 at 20:34, Jiebing Chen <jiebing.chen@amlogic.com> wrote:
>
>> 在 2025/1/14 19:16, Jerome Brunet 写道:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On Tue 14 Jan 2025 at 16:52, Jiebing Chen <jiebing.chen@amlogic.com> wrote:
>>>
>>>> 在 2025/1/13 22:50, Jerome Brunet 写道:
>>>>> [ EXTERNAL EMAIL ]
>>>>>
>>>>> On Mon 13 Jan 2025 at 14:35, jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:
>>>>>
>>>>>> From: jiebing chen <jiebing.chen@amlogic.com>
>>>>>>
>>>>>> Add basic audio driver support for the Amlogic S4 based Amlogic
>>>>>> AQ222 board.
>>>>>>
>>>>>> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
>>>>>> ---
>>>>>>     .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 226 ++++++++++++
>>>>>>     arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 385 ++++++++++++++++++++-
>>>>>>     2 files changed, 610 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>> b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>>>>>> index 6730c44642d2910d42ec0c4adf49fefc3514dbec..32f50a5b860435d50d9c5528b43422b705b20130 100644
>>>>>> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>>>>>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>>>>>> @@ -75,6 +75,19 @@ vddio_ao1v8: regulator-vddio-ao1v8 {
>>>>>>                 regulator-always-on;
>>>>>>          };
>>>>>>
>>>>>> +     vcc5v_reg: regulator-vcc-5v {
>>>>>> +             compatible = "regulator-fixed";
>>>>>> +             vin-supply = <&main_12v>;
>>>>>> +             regulator-name = "VCC5V";
>>>>>> +             regulator-min-microvolt = <5000000>;
>>>>>> +             regulator-max-microvolt = <5000000>;
>>>>>> +             gpio = <&gpio GPIOH_7 GPIO_ACTIVE_HIGH>;
>>>>>> +             startup-delay-us = <7000>;
>>>>>> +             enable-active-high;
>>>>>> +             regulator-boot-on;
>>>>>> +             regulator-always-on;
>>>>>> +     };
>>>>>> +
>>>>>>          /* SY8120B1ABC DC/DC Regulator. */
>>>>>>          vddcpu: regulator-vddcpu {
>>>>>>                  compatible = "pwm-regulator";
>>>>>> @@ -129,6 +142,219 @@ vddcpu: regulator-vddcpu {
>>>>>>                                  <699000 98>,
>>>>>>                                  <689000 100>;
>>>>>>          };
>>>>>> +     dmics: audio-codec-1 {
>>>>>> +             compatible = "dmic-codec";
>>>>>> +             #sound-dai-cells = <0>;
>>>>>> +             num-channels = <2>;
>>>>>> +             wakeup-delay-ms = <50>;
>>>>>> +             sound-name-prefix = "MIC";
>>>>>> +     };
>>>>>> +
>>>>>> +     dioo2133: audio-amplifier-0 {
>>>>>> +             compatible = "simple-audio-amplifier";
>>>>>> +             enable-gpios = <&gpio GPIOH_8 GPIO_ACTIVE_HIGH>;
>>>>>> +             VCC-supply = <&vcc5v_reg>;
>>>>>> +             #sound-dai-cells = <0>;
>>>>>> +             sound-name-prefix = "10U2";
>>>>>> +     };
>>>>>> +
>>>>>> +     spdif_dir: audio-spdif-in {
>>>>>> +             compatible = "linux,spdif-dir";
>>>>>> +             #sound-dai-cells = <0>;
>>>>>> +             sound-name-prefix = "DIR";
>>>>>> +     };
>>>>>> +
>>>>>> +     spdif_dit: audio-spdif-out {
>>>>>> +             compatible = "linux,spdif-dit";
>>>>>> +             #sound-dai-cells = <0>;
>>>>>> +             sound-name-prefix = "DIT";
>>>>>> +     };
>>>>>> +
>>>>>> +     sound {
>>>>>> +             compatible = "amlogic,axg-sound-card";
>>>>>> +             model = "aq222";
>>>>>> +             audio-widgets = "Line", "Lineout";
>>>>>> +             audio-aux-devs = <&tdmout_a>, <&tdmout_b>, <&tdmout_c>,
>>>>>> +                              <&tdmin_a>, <&tdmin_b>, <&tdmin_c>,
>>>>>> +                              <&tdmin_lb>, <&dioo2133>, <&tdmout_pad>, <&toacodec>;
>>>>>> +             audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
>>>>>> +                             "TDMOUT_A IN 1", "FRDDR_B OUT 0",
>>>>>> +                             "TDMOUT_A IN 2", "FRDDR_C OUT 0",
>>>>>> +                             "TDM_A Playback", "TDMOUT_A OUT",
>>>>>> +                             "TDMA_OUT SEL",   "TDM_A Playback",
>>>>>> +                             "TDMOUT_B IN 0", "FRDDR_A OUT 1",
>>>>>> +                             "TDMOUT_B IN 1", "FRDDR_B OUT 1",
>>>>>> +                             "TDMOUT_B IN 2", "FRDDR_C OUT 1",
>>>>>> +                             "TDM_B Playback", "TDMOUT_B OUT",
>>>>>> +                             "TDMB_OUT SEL",   "TDM_B Playback",
>>>>>> +                             "TDMOUT_C IN 0", "FRDDR_A OUT 2",
>>>>>> +                             "TDMOUT_C IN 1", "FRDDR_B OUT 2",
>>>>>> +                             "TDMOUT_C IN 2", "FRDDR_C OUT 2",
>>>>>> +                             "TDM_C Playback", "TDMOUT_C OUT",
>>>>>> +                             "TDMC_OUT SEL",   "TDM_C Playback",
>>>>>> +                             "TOACODEC TDMA", "TDM_A Playback",
>>>>>> +                             "TOACODEC TDMB", "TDM_B Playback",
>>>>>> +                             "TOACODEC TDMC", "TDM_C Playback",
>>>>>> +                             "SPDIFOUT_A IN 0", "FRDDR_A OUT 3",
>>>>>> +                             "SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
>>>>>> +                             "SPDIFOUT_A IN 2", "FRDDR_C OUT 3",
>>>>>> +                             "SPDIFOUT_B IN 0", "FRDDR_A OUT 4",
>>>>>> +                             "SPDIFOUT_B IN 1", "FRDDR_B OUT 4",
>>>>>> +                             "SPDIFOUT_B IN 2", "FRDDR_C OUT 4",
>>>>>> +                             "TDMIN_A IN 0", "TDM_A Capture",
>>>>>> +                             "TDMIN_A IN 1", "TDM_B Capture",
>>>>>> +                             "TDMIN_A IN 2", "TDM_C Capture",
>>>>>> +                             "TDMIN_A IN 3", "TDM_A Loopback",
>>>>>> +                             "TDMIN_A IN 4", "TDM_B Loopback",
>>>>>> +                             "TDMIN_A IN 5", "TDM_C Loopback",
>>>>>> +                             "TDMIN_B IN 0", "TDM_A Capture",
>>>>>> +                             "TDMIN_B IN 1", "TDM_B Capture",
>>>>>> +                             "TDMIN_B IN 2", "TDM_C Capture",
>>>>>> +                             "TDMIN_B IN 3", "TDM_A Loopback",
>>>>>> +                             "TDMIN_B IN 4", "TDM_B Loopback",
>>>>>> +                             "TDMIN_B IN 5", "TDM_C Loopback",
>>>>>> +                             "TDMIN_C IN 0", "TDM_A Capture",
>>>>>> +                             "TDMIN_C IN 1", "TDM_B Capture",
>>>>>> +                             "TDMIN_C IN 2", "TDM_C Capture",
>>>>>> +                             "TDMIN_C IN 3", "TDM_A Loopback",
>>>>>> +                             "TDMIN_C IN 4", "TDM_B Loopback",
>>>>>> +                             "TDMIN_C IN 5", "TDM_C Loopback",
>>>>>> +                             "TDMIN_LB IN 3", "TDM_A Capture",
>>>>>> +                             "TDMIN_LB IN 4", "TDM_B Capture",
>>>>>> +                             "TDMIN_LB IN 5", "TDM_C Capture",
>>>>>> +                             "TDMIN_LB IN 0", "TDM_A Loopback",
>>>>>> +                             "TDMIN_LB IN 1", "TDM_B Loopback",
>>>>>> +                             "TDMIN_LB IN 2", "TDM_C Loopback",
>>>>>> +                             "TODDR_A IN 0", "TDMIN_A OUT",
>>>>>> +                             "TODDR_B IN 0", "TDMIN_A OUT",
>>>>>> +                             "TODDR_C IN 0", "TDMIN_A OUT",
>>>>>> +                             "TODDR_A IN 1", "TDMIN_B OUT",
>>>>>> +                             "TODDR_B IN 1", "TDMIN_B OUT",
>>>>>> +                             "TODDR_C IN 1", "TDMIN_B OUT",
>>>>>> +                             "TODDR_A IN 2", "TDMIN_C OUT",
>>>>>> +                             "TODDR_B IN 2", "TDMIN_C OUT",
>>>>>> +                             "TODDR_C IN 2", "TDMIN_C OUT",
>>>>>> +                             "TODDR_A IN 3", "SPDIFIN Capture",
>>>>>> +                             "TODDR_B IN 3", "SPDIFIN Capture",
>>>>>> +                             "TODDR_C IN 3", "SPDIFIN Capture",
>>>>>> +                             "TODDR_A IN 6", "TDMIN_LB OUT",
>>>>>> +                             "TODDR_B IN 6", "TDMIN_LB OUT",
>>>>>> +                             "TODDR_C IN 6", "TDMIN_LB OUT",
>>>>>> +                             "10U2 INL", "ACODEC LOLP",
>>>>>> +                             "10U2 INR", "ACODEC LORP",
>>>>>> +                             "Lineout", "10U2 OUTL",
>>>>>> +                             "Lineout", "10U2 OUTR";
>>>>>> +             assigned-clocks = <&clkc_pll CLKID_HIFI_PLL>,
>>>>>> +                               <&clkc_pll CLKID_MPLL2>,
>>>>>> +                               <&clkc_pll CLKID_MPLL0>,
>>>>>> +                               <&clkc_pll CLKID_MPLL1>;
>>>>>> +             assigned-clock-rates = <491520000>,
>>>>>> +                                    <294912000>,
>>>>>> +                                    <270950400>,
>>>>>> +                                    <393216000>;
>>>>> Why do you need 4 base rates ? Which rate family does each provide ?
>>>> hifipll 49152000, mpll2 294912000 mpll0 270950400, mpll1 393216000, the
>>>> accuracy of hifipll
>>>>
>>>> is relatively high, for tdm/pdm/spdif 16/48/96/192k we can use it. if the
>>>> tdm and spdif work on
>>> It is fine to use the HiFi. I'm glad this clock finally got fixed
>>>
>>>> the same time, for example ,tdm 48k. spdif 44.1k, we can't use the same
>>>> pll, so spdif need use the mpll 0
>>>>
>>>> other pll , only set a default value, at the latest chip, we remove all
>>>> mpll for hardware, only two hifipll
>>> I'm not sure you understand how this works.
>>> There is 3 families of audio rate: 48kHz, 44.1kHz and 32kHz
>>>
>>> Each family needs a PLL assigned, so you need 3, not 4, unless there is
>>> another specific rate family you want to support. If that's the case,
>>> document it.
>>>
>>> Setting the rate of the PLL should follow this principle:
>>> * Family rate
>>>     - multiplied by (32 x 24): to accomodate different sample sizes
>>>     - multiplied by 2 until you reach the maximum rate of selected PLLs
>>>       This allows to support rates such 192k or even 768k
>>>
>>> 491520000 is not dividable by 3, it won't allow 24 bits words. It is a
>>> poor choice.
>>>
>>> Have a look at the s400 for an example using the HiFi PLL. The axg was
>>> restricted to a 68 PLL multiplier but the S4 is not so you should be
>>> able to use a higher base rate (4 718 592 000 Hz), providing better
>>> accuracy in the end
>> for new soc audio ip, the hardware will not support the 24bit(include g12a,
>> sm1,axg)
> That may be what you chose to support in your BSP but that not how it
> works in mainline. 24bits slot width is supported and has been tested on
> axg, g12 and sm1. This is not going away.
>
> I would find extremely odd that 24 bits slot width is not supported on s4,
> but as long you document this, it is fine by me.

i understand your meaning, you sad we configure the slot width 24bit for 
tdmout control

if the format the SNDRV_PCM_FMTBIT_S24,  it send the 24bit data, for the 
format, and send the 24bit clock

if tdmout control can cut out [24:0] from the fddr, maybe your right, we 
can send the 24 bit accoring to the slot width

but it can't confirm by us, we are worried that there may be potential 
risks, so we don't use it thay way

so this why i sad can't support the 24bit slot clock, 16/32 sample bit 
is fully validated


>> SNDRV_PCM_FMTBIT_S24_3LE, 24 bit in memory
> I think you are mixing up slot width and memory representation
>
