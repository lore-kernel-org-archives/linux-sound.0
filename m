Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ADD32A3EC;
	Mon, 18 May 2026 07:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779087812; cv=none; b=ZeUC889ufoTrBfELIPRT23UktwyNK+96vsbmxNMlHAlrpb2dsUvOIUlNsMM+8TGqZi9dOgFajeqji0lzNgGiEF2kAb1w1tF1mtrZ56YotNDjGNRS7I4+z8q2qFGEGi8Z7g/L2p69PECjXd17aeYx9nJ9T4126sCrP2cqghWZSaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779087812; c=relaxed/simple;
	bh=qdlDyRqfwM7I4mZX/4GtYVGev4d6+WV8l6JhaOKZwMs=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=VqUxr9uOKxOSZtEv9noTTHHvWzsnnRMSdCS/Dl6hIZjoqq7BKbzi9wI1gGWrCDB47v9rfbggbd5Rie91OtMJkLMkjU0C697tNQQ0bOAjWzHUyeSXJ/10XcuSlVdzG5kBBy84WnLBIOPdzpi+6Hbv/KW7ai2UDbivNYOQeHmbblY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: a693680e528711f1aa26b74ffac11d73-20260518
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:0ee663f3-9fd2-4605-b908-3d01e7150fcd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:29f14ceaefe4502a18d0ae533f6a2a2f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|817|865|898,TC:nil,Conte
	nt:-10|-8|-5|14|50,EDM:-3,IP:nil,URL:0,File:127,RT:nil,Bulk:nil,QS:nil,BEC
	:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a693680e528711f1aa26b74ffac11d73-20260518
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.77] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 980122514; Mon, 18 May 2026 15:03:19 +0800
Content-Type: multipart/mixed; boundary="------------qHAHnfkUAEj4QfhGIQoL09Yu"
Message-ID: <5e30ba3c-10ef-45fa-888d-1ed72f2a2435@kylinos.cn>
Date: Mon, 18 May 2026 15:03:15 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: [PATCH] ALSA: hda/generic: Add mic autoswitch support for
 dyn_adc_switch mode
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Cc: tiwai@suse.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <5b215802-4c94-4f94-9cee-f8e497b31337@kylinos.cn>
 <a7daf8a3-559b-4532-a2ee-a211a7e0e0b0@kylinos.cn>
 <87ecjnp8dx.wl-tiwai@suse.de>
 <7493b4e0-2b8c-435f-8421-ed397593356a@kylinos.cn>
 <be6ddfdc-7cd2-460f-be75-c30f90a1bceb@kylinos.cn>
 <87ecjdt487.wl-tiwai@suse.de> <7698e8ba-974b-4bdd-a2ce-21a32e50c1de@perex.cz>
Content-Language: en-US
From: Zhang Heng <zhangheng@kylinos.cn>
In-Reply-To: <7698e8ba-974b-4bdd-a2ce-21a32e50c1de@perex.cz>

This is a multi-part message in MIME format.
--------------qHAHnfkUAEj4QfhGIQoL09Yu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> It's more likely the app interpretation (PA/PW) rather than alsa-lib. 
> The "Input Source" means that there are more capture PCM devices and 
> those controls distinguish the input sources for them.
>
> It would be nice to see the 'amixer controls' output to see more 
> details what the driver exposes to the user space.
>
>                     Jaroslav
>
Thank you for your attention to this issue. This is the information from 
the problematic machine.

My colleague suspects it's because 'amixer scontrols' does not show a 
'capture source' similar to 'input source'. I'm not sure if that's the case.

--------------qHAHnfkUAEj4QfhGIQoL09Yu
Content-Type: text/plain; charset=UTF-8; name="controls.txt"
Content-Disposition: attachment; filename="controls.txt"
Content-Transfer-Encoding: base64

bnVtaWQ9MTYsaWZhY2U9Q0FSRCxuYW1lPSdGcm9udCBIZWFkcGhvbmUgSmFjaycKbnVtaWQ9
MTQsaWZhY2U9Q0FSRCxuYW1lPSdMaW5lIEphY2snCm51bWlkPTE1LGlmYWNlPUNBUkQsbmFt
ZT0nTGluZSBPdXQgSmFjaycKbnVtaWQ9MTIsaWZhY2U9Q0FSRCxuYW1lPSdNaWMgSmFjaycK
bnVtaWQ9MTMsaWZhY2U9Q0FSRCxuYW1lPSdSZWFyIE1pYyBKYWNrJwpudW1pZD0xMSxpZmFj
ZT1NSVhFUixuYW1lPSdNYXN0ZXIgUGxheWJhY2sgU3dpdGNoJwpudW1pZD0xMCxpZmFjZT1N
SVhFUixuYW1lPSdNYXN0ZXIgUGxheWJhY2sgVm9sdW1lJwpudW1pZD00LGlmYWNlPU1JWEVS
LG5hbWU9J0hlYWRwaG9uZSBQbGF5YmFjayBTd2l0Y2gnCm51bWlkPTMsaWZhY2U9TUlYRVIs
bmFtZT0nSGVhZHBob25lIFBsYXliYWNrIFZvbHVtZScKbnVtaWQ9MTksaWZhY2U9TUlYRVIs
bmFtZT0nUENNIFBsYXliYWNrIFZvbHVtZScKbnVtaWQ9MixpZmFjZT1NSVhFUixuYW1lPSdM
aW5lIE91dCBQbGF5YmFjayBTd2l0Y2gnCm51bWlkPTEsaWZhY2U9TUlYRVIsbmFtZT0nTGlu
ZSBPdXQgUGxheWJhY2sgVm9sdW1lJwpudW1pZD03LGlmYWNlPU1JWEVSLG5hbWU9J0NhcHR1
cmUgU291cmNlJwpudW1pZD05LGlmYWNlPU1JWEVSLG5hbWU9J0NhcHR1cmUgU3dpdGNoJwpu
dW1pZD04LGlmYWNlPU1JWEVSLG5hbWU9J0NhcHR1cmUgVm9sdW1lJwpudW1pZD01LGlmYWNl
PU1JWEVSLG5hbWU9J0xvb3BiYWNrIE1peGluZycKbnVtaWQ9NixpZmFjZT1NSVhFUixuYW1l
PSdBdXRvLU11dGUgTW9kZScKbnVtaWQ9MTgsaWZhY2U9UENNLG5hbWU9J0NhcHR1cmUgQ2hh
bm5lbCBNYXAnCm51bWlkPTE3LGlmYWNlPVBDTSxuYW1lPSdQbGF5YmFjayBDaGFubmVsIE1h
cCcK
--------------qHAHnfkUAEj4QfhGIQoL09Yu
Content-Type: text/plain; charset=UTF-8; name="scontents.txt"
Content-Disposition: attachment; filename="scontents.txt"
Content-Transfer-Encoding: base64

U2ltcGxlIG1peGVyIGNvbnRyb2wgJ01hc3RlcicsMAogIENhcGFiaWxpdGllczogcHZvbHVt
ZSBwdm9sdW1lLWpvaW5lZCBwc3dpdGNoIHBzd2l0Y2gtam9pbmVkCiAgUGxheWJhY2sgY2hh
bm5lbHM6IE1vbm8KICBMaW1pdHM6IFBsYXliYWNrIDAgLSA4MAogIE1vbm86IFBsYXliYWNr
IDUyIFs2NSVdIFstMjguMDBkQl0gW29uXQpTaW1wbGUgbWl4ZXIgY29udHJvbCAnSGVhZHBo
b25lJywwCiAgQ2FwYWJpbGl0aWVzOiBwdm9sdW1lIHBzd2l0Y2gKICBQbGF5YmFjayBjaGFu
bmVsczogRnJvbnQgTGVmdCAtIEZyb250IFJpZ2h0CiAgTGltaXRzOiBQbGF5YmFjayAwIC0g
ODAKICBNb25vOgogIEZyb250IExlZnQ6IFBsYXliYWNrIDgwIFsxMDAlXSBbMC4wMGRCXSBb
b25dCiAgRnJvbnQgUmlnaHQ6IFBsYXliYWNrIDgwIFsxMDAlXSBbMC4wMGRCXSBbb25dClNp
bXBsZSBtaXhlciBjb250cm9sICdQQ00nLDAKICBDYXBhYmlsaXRpZXM6IHB2b2x1bWUKICBQ
bGF5YmFjayBjaGFubmVsczogRnJvbnQgTGVmdCAtIEZyb250IFJpZ2h0CiAgTGltaXRzOiBQ
bGF5YmFjayAwIC0gMjU1CiAgTW9ubzoKICBGcm9udCBMZWZ0OiBQbGF5YmFjayAyNTUgWzEw
MCVdIFswLjAwZEJdCiAgRnJvbnQgUmlnaHQ6IFBsYXliYWNrIDI1NSBbMTAwJV0gWzAuMDBk
Ql0KU2ltcGxlIG1peGVyIGNvbnRyb2wgJ0xpbmUnLDAKICBDYXBhYmlsaXRpZXM6IGNzd2l0
Y2ggY3N3aXRjaC1qb2luZWQgY3N3aXRjaC1leGNsdXNpdmUKICBDYXB0dXJlIGV4Y2x1c2l2
ZSBncm91cDogMAogIENhcHR1cmUgY2hhbm5lbHM6IE1vbm8KICBNb25vOiBDYXB0dXJlIFtv
ZmZdClNpbXBsZSBtaXhlciBjb250cm9sICdMaW5lIE91dCcsMAogIENhcGFiaWxpdGllczog
cHZvbHVtZSBwc3dpdGNoCiAgUGxheWJhY2sgY2hhbm5lbHM6IEZyb250IExlZnQgLSBGcm9u
dCBSaWdodAogIExpbWl0czogUGxheWJhY2sgMCAtIDgwCiAgTW9ubzoKICBGcm9udCBMZWZ0
OiBQbGF5YmFjayAwIFswJV0gWy04MC4wMGRCXSBbb2ZmXQogIEZyb250IFJpZ2h0OiBQbGF5
YmFjayAwIFswJV0gWy04MC4wMGRCXSBbb2ZmXQpTaW1wbGUgbWl4ZXIgY29udHJvbCAnTWlj
JywwCiAgQ2FwYWJpbGl0aWVzOiBjc3dpdGNoIGNzd2l0Y2gtam9pbmVkIGNzd2l0Y2gtZXhj
bHVzaXZlCiAgQ2FwdHVyZSBleGNsdXNpdmUgZ3JvdXA6IDAKICBDYXB0dXJlIGNoYW5uZWxz
OiBNb25vCiAgTW9ubzogQ2FwdHVyZSBbb25dClNpbXBsZSBtaXhlciBjb250cm9sICdDYXB0
dXJlJywwCiAgQ2FwYWJpbGl0aWVzOiBjdm9sdW1lIGNzd2l0Y2gKICBDYXB0dXJlIGNoYW5u
ZWxzOiBGcm9udCBMZWZ0IC0gRnJvbnQgUmlnaHQKICBMaW1pdHM6IENhcHR1cmUgMCAtIDgw
CiAgRnJvbnQgTGVmdDogQ2FwdHVyZSA4MCBbMTAwJV0gWzYuMDBkQl0gW29uXQogIEZyb250
IFJpZ2h0OiBDYXB0dXJlIDgwIFsxMDAlXSBbNi4wMGRCXSBbb25dClNpbXBsZSBtaXhlciBj
b250cm9sICdBdXRvLU11dGUgTW9kZScsMAogIENhcGFiaWxpdGllczogZW51bQogIEl0ZW1z
OiAnRGlzYWJsZWQnICdFbmFibGVkJwogIEl0ZW0wOiAnRW5hYmxlZCcKU2ltcGxlIG1peGVy
IGNvbnRyb2wgJ0xvb3BiYWNrIE1peGluZycsMAogIENhcGFiaWxpdGllczogZW51bQogIEl0
ZW1zOiAnRGlzYWJsZWQnICdFbmFibGVkJwogIEl0ZW0wOiAnRGlzYWJsZWQnClNpbXBsZSBt
aXhlciBjb250cm9sICdSZWFyIE1pYycsMAogIENhcGFiaWxpdGllczogY3N3aXRjaCBjc3dp
dGNoLWpvaW5lZCBjc3dpdGNoLWV4Y2x1c2l2ZQogIENhcHR1cmUgZXhjbHVzaXZlIGdyb3Vw
OiAwCiAgQ2FwdHVyZSBjaGFubmVsczogTW9ubwogIE1vbm86IENhcHR1cmUgW29mZl0K
--------------qHAHnfkUAEj4QfhGIQoL09Yu
Content-Type: text/plain; charset=UTF-8; name="scontrols.txt"
Content-Disposition: attachment; filename="scontrols.txt"
Content-Transfer-Encoding: base64

U2ltcGxlIG1peGVyIGNvbnRyb2wgJ01hc3RlcicsMApTaW1wbGUgbWl4ZXIgY29udHJvbCAn
SGVhZHBob25lJywwClNpbXBsZSBtaXhlciBjb250cm9sICdQQ00nLDAKU2ltcGxlIG1peGVy
IGNvbnRyb2wgJ0xpbmUnLDAKU2ltcGxlIG1peGVyIGNvbnRyb2wgJ0xpbmUgT3V0JywwClNp
bXBsZSBtaXhlciBjb250cm9sICdNaWMnLDAKU2ltcGxlIG1peGVyIGNvbnRyb2wgJ0NhcHR1
cmUnLDAKU2ltcGxlIG1peGVyIGNvbnRyb2wgJ0F1dG8tTXV0ZSBNb2RlJywwClNpbXBsZSBt
aXhlciBjb250cm9sICdMb29wYmFjayBNaXhpbmcnLDAKU2ltcGxlIG1peGVyIGNvbnRyb2wg
J1JlYXIgTWljJywwCg==

--------------qHAHnfkUAEj4QfhGIQoL09Yu--
