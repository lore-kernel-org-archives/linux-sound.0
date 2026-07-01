Received: from forward100d.mail.yandex.net (forward100d.mail.yandex.net [178.154.239.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809A53624D3
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 16:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922924; cv=none; b=ZPrNVnPy1emGtip9AlcT/NYE4fRmRiZw6CITPMJFO8x/ieyWunEV6lIMhKMmJa+o4VnT+kd7jWLx2XQpjJj+1w7RVjTS3dptmICIestfiVzI03GOV6zQiw3xgV2ZwYn77yk+TaV8uCwQZvYrau2WfVZw0BVob1Evqd2GZImR2gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922924; c=relaxed/simple;
	bh=F7+ICc/4/DYPpPHGGa3QSv1udU6QjdF3H9XyXw8HeA0=;
	h=From:To:Cc:Subject:MIME-Version:Date:Message-Id:Content-Type; b=kKIG0JENXgwpoxPJNCRRXABG40mQSf7o6R5DGLqZ6F95yVBzsNM+DTThSSD2zwLRzMSiFSIN4GBRhtGD9QBOywny9Cn8/RZiJqyOw+4k8X2Ye1Jqa0UAAbYiSV2eRPEAhGCzSF6auLbbSr1Ih3r1VbYxl4tEyksYIMPyOpbYfek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=synthwaver.ru; spf=pass smtp.mailfrom=synthwaver.ru; dkim=pass (1024-bit key) header.d=synthwaver.ru header.i=@synthwaver.ru header.b=PK/erMBp; arc=none smtp.client-ip=178.154.239.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=synthwaver.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synthwaver.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=synthwaver.ru header.i=@synthwaver.ru header.b="PK/erMBp"
Received: from mail-nwsmtp-mxback-production-main-78.iva.yp-c.yandex.net (mail-nwsmtp-mxback-production-main-78.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:1591:0:640:6fdf:0])
	by forward100d.mail.yandex.net (postfix) with ESMTPS id 3EFB0C0078;
	Wed, 01 Jul 2026 19:21:51 +0300 (MSK)
Received: from mail.yandex.ru (2a02:6b8:c0c:2016:0:640:ce87:0 [2a02:6b8:c0c:2016:0:640:ce87:0])
	by mail-nwsmtp-mxback-production-main-78.iva.yp-c.yandex.net (mxback) with HTTPS id TLivi81vg0U0-johl5YAF;
	Wed, 01 Jul 2026 19:21:50 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synthwaver.ru;
	s=mail; t=1782922910;
	bh=4cPYmWNQre1/HDurAmzX3afIi1uc6PSRPHilCYH9/OQ=;
	h=Message-Id:Date:Subject:To:From:Cc;
	b=PK/erMBpCaAyP3Ibj42pNMHu8Nfh6obkRdidBn0OMj31M8fXFYn9DhSb5eGDKNCe5
	 ai9odMjovi5mOR5nr7LP5xrrUYoJkroDnIcfq67gtTRe9QmxafuSGCcVZE8fb6jvPa
	 J2aV2IgyYamNMK6Lyq4CyHbZQuw+0zz8Y5+43uMg=
Authentication-Results: mail-nwsmtp-mxback-production-main-78.iva.yp-c.yandex.net; dkim=pass header.i=@synthwaver.ru
Received: by mail-sendbernar-production-main-54.iva.yp-c.yandex.net (sendbernar) with HTTPS id 2655f7d9fca739b3c42df1323086530c;
	Wed, 01 Jul 2026 19:21:49 +0300
From: =?utf-8?B?0KHQsNCx0LjRgNC+0LIg0JzQuNGF0LDQuNC7INCc0YPRhdCw0LzQsNGC0YjQsNGA0LjRhNC+0LLQuNGH?= <me@synthwaver.ru>
To: "broonie@kernel.org" <broonie@kernel.org>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: [PATCH] ASoC: amd: yc: Add support for Acer Extensa 215-23 (HerbagEX_MDU)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Wed, 01 Jul 2026 21:21:49 +0500
Message-Id: <7395121782922532@mail.yandex.ru>
Content-Type: multipart/mixed;
	boundary="----==--bound.524077.ee7714ad-db95-4234-abb4-be028c90f553"


------==--bound.524077.ee7714ad-db95-4234-abb4-be028c90f553
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8

PGRpdj48ZGl2PkFkZCBETUkgcXVpcmsgdGFibGUgZW50cnkgZm9yIHRoZSBNREMgSGVyYmFnRVhf
TURVIGJvYXJkIGZvdW5kIGluPC9kaXY+PGRpdj5BY2VyIEV4dGVuc2EgMjE1LTIzIGxhcHRvcHMg
KEFNRCBSeXplbiA1IDc1MjBVLCBSZW1icmFuZHQgcGxhdGZvcm0pLjwvZGl2PjxkaXY+wqA8L2Rp
dj48ZGl2PldpdGhvdXQgdGhpcyBlbnRyeSwgdGhlIEFDUDZ4IFBETSBtYWNoaW5lIGRyaXZlciBz
aWxlbnRseSBmYWlscyB0bzwvZGl2PjxkaXY+cHJvYmUgKGZhbGxzIGJhY2sgdG8gQUNQSSBtYXRj
aGluZyB3aGljaCBkb2VzIG5vdCBzdWNjZWVkIG9uIHRoaXM8L2Rpdj48ZGl2PmJvYXJkKSwgYW5k
IHRoZSBpbnRlcm5hbCBkaWdpdGFsIG1pY3JvcGhvbmUgbmV2ZXIgcmVnaXN0ZXJzIGEgc291bmQ8
L2Rpdj48ZGl2PmNhcmQsIGV2ZW4gdGhvdWdoIHRoZSBoYXJkd2FyZSBhbmQgZmlybXdhcmUgZnVs
bHkgc3VwcG9ydCBpdCAodGhlPC9kaXY+PGRpdj5taWNyb3Bob25lIHdvcmtzIGNvcnJlY3RseSB1
bmRlciBXaW5kb3dzIG9uIHRoZSBzYW1lIG1hY2hpbmUpLjwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2
PkNvbmZpcm1lZCB3b3JraW5nIGFmdGVyIGFkZGluZyB0aGlzIHF1aXJrOiAvcHJvYy9hc291bmQv
Y2FyZHMgc2hvd3M8L2Rpdj48ZGl2PnRoZSBuZXcgImFjcDZ4IiBjYXJkLCBhbmQgYXJlY29yZCAt
bCBleHBvc2VzIGEgRE1JQyBjYXB0dXJlIGRldmljZTwvZGl2PjxkaXY+dGhhdCByZWNvcmRzIGF1
ZGlvIGNvcnJlY3RseS4gVmVyaWZpZWQgdmlhIHB3LXJlY29yZCArIHNveCBzdGF0OjwvZGl2Pjxk
aXY+Uk1TIGFtcGxpdHVkZSB+MC4wNi0wLjEwIGR1cmluZyBsaXZlIHNwZWVjaCwgdmVyc3VzIH4w
LjAwMDMtMC4wMDM8L2Rpdj48ZGl2Pm5vaXNlIGZsb29yIHJlY29yZGVkIHdpdGhvdXQgdGhlIGZp
eCAoaS5lLiBlZmZlY3RpdmVseSBzaWxlbmNlKS48L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5ETUkg
aW5mbyBmcm9tIHRoZSBhZmZlY3RlZCBtYWNoaW5lOjwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PsKg
IMKgICMgZG1pZGVjb2RlIC10IGJhc2Vib2FyZDwvZGl2PjxkaXY+wqAgwqAgTWFudWZhY3R1cmVy
OiBNREM8L2Rpdj48ZGl2PsKgIMKgIFByb2R1Y3QgTmFtZTogSGVyYmFnRVhfTURVPC9kaXY+PGRp
dj7CoCDCoCBWZXJzaW9uOiBWMS4yMDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PlNpZ25lZC1vZmYt
Ynk6IFNhYmlyb3YgTWlraGFpbCBpdC45NkB5YW5kZXgucnU8L2Rpdj48ZGl2Pi0tLTwvZGl2Pjxk
aXY+wqBzb3VuZC9zb2MvYW1kL3ljL2FjcDZ4LW1hY2guYyB8IDcgKysrKysrKzwvZGl2PjxkaXY+
wqAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+
ZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9hbWQveWMvYWNwNngtbWFjaC5jIGIvc291bmQvc29jL2Ft
ZC95Yy9hY3A2eC1tYWNoLmM8L2Rpdj48ZGl2PmluZGV4IDY5YzY4ZDhlN2E2Yi4uMTc2MGI1ZDQy
NDYwIDEwMDY0NDwvZGl2PjxkaXY+LS0tIGEvc291bmQvc29jL2FtZC95Yy9hY3A2eC1tYWNoLmM8
L2Rpdj48ZGl2PisrKyBiL3NvdW5kL3NvYy9hbWQveWMvYWNwNngtbWFjaC5jPC9kaXY+PGRpdj5A
QCAtNjM3LDYgKzYzNywxMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQgeWNf
YWNwX3F1aXJrX3RhYmxlW10gPSB7PCEtLSAtLT48L2Rpdj48ZGl2PsKgIMKgIMKgIMKgIMKgIMKg
IMKgRE1JX01BVENIKERNSV9CT0FSRF9OQU1FLCAiSGVyYmFnX01EVSIpLDwvZGl2PjxkaXY+wqAg
wqAgwqAgwqAgwqB9PC9kaXY+PGRpdj7CoCDCoCDCoH0sPC9kaXY+PGRpdj4rwqAgwqAgezwhLS0g
LS0+PC9kaXY+PGRpdj4rwqAgwqAgwqAgwqAgLmRyaXZlcl9kYXRhID0gJmFtcDthY3A2eF9jYXJk
LDwvZGl2PjxkaXY+K8KgIMKgIMKgIMKgIC5tYXRjaGVzID0gezwhLS0gLS0+PC9kaXY+PGRpdj4r
wqAgwqAgwqAgwqAgwqAgwqAgRE1JX01BVENIKERNSV9CT0FSRF9WRU5ET1IsICJNREMiKSw8L2Rp
dj48ZGl2PivCoCDCoCDCoCDCoCDCoCDCoCBETUlfTUFUQ0goRE1JX0JPQVJEX05BTUUsICJIZXJi
YWdFWF9NRFUiKSw8L2Rpdj48ZGl2PivCoCDCoCDCoCDCoCB9PC9kaXY+PGRpdj4rwqAgwqAgfSw8
L2Rpdj48ZGl2PsKgIMKgIMKgezwhLS0gLS0+PC9kaXY+PGRpdj7CoCDCoCDCoCDCoCDCoC5kcml2
ZXJfZGF0YSA9ICZhbXA7YWNwNnhfY2FyZCw8L2Rpdj48ZGl2PsKgIMKgIMKgIMKgIMKgLm1hdGNo
ZXMgPSB7PCEtLSAtLT48L2Rpdj48ZGl2Pi0twqA8L2Rpdj48ZGl2PjIuNDQuMDwvZGl2PjwvZGl2
Pg==
------==--bound.524077.ee7714ad-db95-4234-abb4-be028c90f553
Content-Disposition: attachment;
	filename="0001-ASoC-amd-yc-Add-support-for-Acer-Extensa-215-23-Herb.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-diff;
	name="0001-ASoC-amd-yc-Add-support-for-Acer-Extensa-215-23-Herb.patch"

RnJvbSBlNDliMjgxNzg1YTIzMWViZDRlZmI0NGNjNWM1YjNkMzdhMjEzNDZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTYWJpcm92IE1pa2hhaWwgPGl0Ljk2QHlhbmRleC5ydT4KRGF0
ZTogV2VkLCAxIEp1bCAyMDI2IDIxOjE0OjQ2ICswNTAwClN1YmplY3Q6IFtQQVRDSF0gQVNvQzog
YW1kOiB5YzogQWRkIHN1cHBvcnQgZm9yIEFjZXIgRXh0ZW5zYSAyMTUtMjMKIChIZXJiYWdFWF9N
RFUpCgpTaWduZWQtb2ZmLWJ5OiBTYWJpcm92IE1pa2hhaWwgPGl0Ljk2QHlhbmRleC5ydT4KLS0t
CiBzb3VuZC9zb2MvYW1kL3ljL2FjcDZ4LW1hY2guYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9hbWQveWMvYWNwNngt
bWFjaC5jIGIvc291bmQvc29jL2FtZC95Yy9hY3A2eC1tYWNoLmMKaW5kZXggZjIxMGEyNTNkLi42
MzVhMDU5YjQgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9hbWQveWMvYWNwNngtbWFjaC5jCisrKyBi
L3NvdW5kL3NvYy9hbWQveWMvYWNwNngtbWFjaC5jCkBAIC02NDAsNiArNjQwLDEzIEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZCB5Y19hY3BfcXVpcmtfdGFibGVbXSA9IHsKIAkJ
CURNSV9NQVRDSChETUlfQk9BUkRfTkFNRSwgIkhlcmJhZ19NRFUiKSwKIAkJfQogCX0sCisgICAg
ICAgIHsKKwkJLmRyaXZlcl9kYXRhID0gJmFjcDZ4X2NhcmQsCisJCS5tYXRjaGVzID0geworCQkJ
RE1JX01BVENIKERNSV9CT0FSRF9WRU5ET1IsICJNREMiKSwKKwkJCURNSV9NQVRDSChETUlfQk9B
UkRfTkFNRSwgIkhlcmJhZ0VYX01EVSIpLAorCQl9CisJfSwKIAl7CiAJCS5kcml2ZXJfZGF0YSA9
ICZhY3A2eF9jYXJkLAogCQkubWF0Y2hlcyA9IHsKLS0gCjIuNDMuMAoK
------==--bound.524077.ee7714ad-db95-4234-abb4-be028c90f553--
